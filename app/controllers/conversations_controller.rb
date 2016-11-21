class ConversationsController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.involving(current_user)

    @conversations.each do |conversation|
      conversation.last_message = conversation.messages.order('created_at').last.body[0..75]
      conversation.count_unread = conversation.messages.unread(conversation.id, current_user).size
    end
  end

  def get_conservation_list
    @conversations = Conversation.involving(current_user)

    @conversations.each do |conversation|
      conversation.last_message = conversation.messages.order('created_at').last.body[0..75]
      conversation.count_unread = conversation.messages.unread(conversation.id, current_user).size
    end

    render @conversations
    # render :template => 'messages/_message.html.erb', :locals => { :message => @message, :current_user => current_user }, layout: false
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages.order('created_at')
    @message = Message.new

    render layout: false
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end