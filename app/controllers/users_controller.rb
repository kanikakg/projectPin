class UsersController < ApplicationController
	def show
		@user = User.find_by_username(params[:username])
    @users = User.all
	end

  def users
    @users = User.all
  end

   def follow
    followee_id = params[:followee_id]
    if current_user.can_follow followee_id
      FollowMapping.create(:followee_id => followee_id, :follower_id => current_user.id)
    else
    end
    return redirect_to '/users'
  end

  def un_follow
     followee_id = params[:followee_id]
     if current_user.can_un_follow followee_id
       FollowMapping.where(:followee_id => followee_id, :follower_id => current_user.id).first.destroy
     else
     end
     return redirect_to '/users'
  end

end
