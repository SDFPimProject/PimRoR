class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @reciever = interlocutor(@conversation)
    @message = @conversation.messages.create(message_params)
    @message.send_from_id = current_user.id
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

  def message_read
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages.where("messages.send_from_id <> ? AND messages.is_read = false", current_user)
    @messages.each do |message|
      message.is_read=true
      message.save!
    end

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