class FollowsController < ApplicationController

  # GET /follows/new
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html
      format.js
      # noti = current_user.send_notifications.create(event: "follow", receiver_id: @user.id, sender_id: current_user.id)
      # ActionCable.server_broadcast "notication_channel", follower: render_follower(current_user)
    end
  end

  def destroy
    @user = Follow.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  # def render_notification notificaiton
  #   render_to_string partial: "notificaitons/notification" locals: {notification: notification}
  # end

  # def render_follower follower
  #   render_to_string partial: "users/follower", locals: {follower: follower}
  # end
end
