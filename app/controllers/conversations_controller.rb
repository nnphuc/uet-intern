class ConversationsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @conversations = []
    @conversations ||= Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def show
    @conversations ||= Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    @conversation = Conversation.find_by id: params[:id]
    if @conversation.nil?
      redirect_to root_url
    else
      @messages = @conversation.messages
      authority_conversation! current_user, @conversation
    end
  end

  def create
    conversation = Conversation.new(sennder_id: current_user.id, receiver_id: @user.id)
    if conversation.save
      noti = current_user.send_notifications.create(event: "Start chatting",
                                                    receiver_id: conversation.receiver_id, object_type: "conversation",
                                                    object_id: conversation.id)
      ActionCable.server.broadcast "notification_conversation_channel",
                                   conversation_id: conversation.id,
                                   notification: render_notification(noti),
                                   owner_conversation: conversation.receiver_id
      redirect_to conversation
    else
      flash[:danger] = conversation.errors.messages[:base][0]
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    conversation = Conversation.find_by id: params[:id]
    redirect_to request.referrer || root_url if conversation.nil?
    if conversation.destroy
      flash[:success] =  "Conversation has been deleted!"
    else
      flash[:error] = "Something went wrong!"
    end
  end

  private
  def authority_conversation! user, conversation
    if user.id != conversation.sender_id && user.id != conversation.receiver_id
      redirect_to request.referrer || root_url
    end
  end

  def render_notification notification
    render_to_string partial: "notifications/notification", locals: {notification: notification}
  end

end
