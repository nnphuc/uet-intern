class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_messages

  def index
  end

  def create
    message = current_user.messages.build messages_params
    @conversation = Conversation.find_by id: params[:message][:conversation_id]
    if message.conversation.sender? message.user_id
      notify_to = message.conversation.receiver.id
    else
      notify_to = message.conversation.sender.id
    end
    if message.save
      ActionCable.server.broadcast "conversation_channel",
                                   message: render_message(message, @conversation),
                                   notify_to: notify_to
    else
      render :index
    end
  end

  private
  def find_messages
    @messages = Message.for_display
  end

  def messages_params
    params.require(:message).permit :content, :conversation_id
  end

  def render_message message, conversation
    render_to_string partial: "messages/message", locals: {message: message, conversation: conversation}
  end
end
