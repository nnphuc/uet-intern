class NotificationFollowChannel < ApplicationCable::Channel
  def subscribed
    strean_from "notification_follow_channel"
    strean_from "notification_follow_channel_user_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
