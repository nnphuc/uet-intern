class FollowsController < ApplicationController


  def create
    @user = User.find(params[:followed_id])
    result = !current_user.follow(@user)
    respond_to do |format|
        format.json do 
            render json: {
                followed_id: @user.id,
                follower_id: current_user.id,
                count: current_user.followers.size,
                sucess: result
            }.to_json
        end
    end
  end

  def destroy
    @user = User.find(params[:followed_id])
    result = !current_user.unfollow(@user)
    respond_to do |format|
        format.json do 
            render json: {
                followed_id: @user.id,
                follower_id: current_user.id,
                count: current_user.followers.size,
                sucess: result
            }.to_json
        end
    end
  end

  
end
