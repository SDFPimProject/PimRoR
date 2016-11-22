class MessagesController < ApplicationController
  include MessagesHelper

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @reciever = interlocutor(@conversation)
    @message = @conversation.messages.create(message_params)
    @message.send_from_id = current_user.id
    @message.is_send = true
    @message.save!

    Fiber.new{
      WebsocketRails[@reciever.id].trigger('new_message', {
          :conversation_id => @conversation.id,
          :message_id => @message.id,
          :send_from => current_user,
          :html => render_to_string(:template => 'messages/_message.html.erb', :locals => { :message => @message, :current_user => @reciever }, layout: false)
      })
    }.resume


    render :template => 'messages/_message.html.erb', :locals => { :message => @message, :current_user => current_user }, layout: false
  end

  def destroy
    conversation = Conversation.find(params[:conversation_id])
    reciever = interlocutor(conversation)
    message = Message.find(params[:id])


    if current_user.id == message.send_from_id
      message.destroy

      Fiber.new{
        WebsocketRails[reciever.id].trigger('delete_message', {
            :conversation_id => conversation.id,
            :message_id => message.id
        })
      }.resume

      render json: { ok: true}
    else
      render json: {ok: false, text: "Permission denied!"}
    end
  end

  def message_read
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages.where("messages.send_from_id <> ? AND messages.is_read = false", current_user)


    @messages.each do |message|
      message.is_read=true
      message.is_receive=true
      message.save!

      Fiber.new{
        WebsocketRails[message.send_from_id].trigger('new_message_status', {
            :conversation_id => @conversation.id,
            :message_id => message.id,
            :html => render_to_string(:template => 'messages/_message-status.html.erb', :locals => { :message => message }, layout: false)
        })
      }.resume
    end

    render json: { ok: true }
  end

  def message_receive
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages.where("messages.send_from_id <> ? AND messages.is_receive = false", current_user)

    set_messages_receive(@conversation.id, @messages)

    render json: { ok: true }
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end