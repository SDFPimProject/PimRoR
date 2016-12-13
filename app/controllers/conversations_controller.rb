class ConversationsController < ApplicationController
  include ConversationsHelper

  layout "chatlayout"

  def index
    @conversations = Conversation.involving(current_user)

    @conversations.each do |conversation|
      conversation.last_message = conversation.messages.order('created_at').last.body[0..75]
      conversation.count_unread = conversation.messages.unread(conversation.id, current_user).size
    end
  end

  def get_landing_page
    conversations = Conversation.involving(current_user)
    random_conversations = conversations.sample(5)
    random_team_and_project_users = User.team_and_project_mates(current_user.users_teams, current_user.users_projects, current_user).sample(10)
    @random_conversation_user = Array.new
    @vip_users = Array.new

    random_conversations.each do |conversation|
      @random_conversation_user.push(interlocutor(conversation))
    end
    random_team_and_project_users.each do |user|
      @vip_users.push(user)
    end

    render :template => 'conversations/_conversation_landing.html.erb', :locals => {:random_conversations => @random_conversation_user, :vip_users => @vip_users}, layout: false
  end

  def get_conservation_list
    @conversations = Conversation.involving(current_user)

    @conversations.each do |conversation|
      conversation.last_message = conversation.messages.order('created_at').last.body[0..75]
      conversation.count_unread = conversation.messages.unread(conversation.id, current_user).size
    end

    render @conversations
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
end