class MessagesController < ApplicationController
  include MessagesHelper
  include ConversationsHelper
  include ActionView::Helpers::TextHelper

  require 'rails_autolink'

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @reciever = interlocutor(@conversation)
    @message = @conversation.messages.create(message_params)

    @message.send_from_id = current_user.id
    message = simple_format(message_params[:body])
    message = auto_link(message, :html => {:target => '_blank'})
    @message.body = message
    @message.is_send = true
    @message.save!

    @conversation.updated_at = Time.now
    @conversation.save!

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
      render json: {ok: false, text: t('messages.permission_denied')}
    end
  end

  def message_read
    conversation = Conversation.find(params[:conversation_id])
    set_messages_read(conversation, true)

    render json: { ok: true }
  end

  def message_receive
    conversation = Conversation.find(params[:conversation_id])
    set_messages_receive(conversation, true)

    render json: { ok: true }
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end