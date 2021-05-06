class RelationshipsController < ApplicationController
  before_action :set_user
  # def follow
  #   following = current_user.follow(@user)
  #   if following.save
  #     flash[:success] = 'ユーザーをフォローしました'
  #     redirect_to @user
  #   else
  #     flash.now[:alert] = 'ユーザーのフォローに失敗しました'
  #     redirect_to @user
  #   end
  # end

  # def destroy
  #   following = current_user.unfollow(@user)
  #   if following.destroy
  #     flash[:success] = 'ユーザーのフォローを解除しました'
  #     redirect_to @user
  #   else
  #     flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
  #     redirect_to @user
  #   end
  # end
  
  # def followings
  #   @users = @user.followings
  #   render 'users/index'
  # end
  
  # def followers
  #   @users = @user.followers
  #   render 'users/index'
  # end
  
  def index
    @user = User.find(params[:id])
    @followings = @user.follower_ids
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followed_ids
  end

  
  def follow
    current_user.follow(@user)
    redirect_to root_path
  end
  
  def unfollow
    current_user.unfollow(@user.id)
    redirect_to root_path
  end
  
      private
  def set_user
    @user = User.find(params[:id])
  end
end
