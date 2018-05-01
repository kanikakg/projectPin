class HomeController < ApplicationController
<<<<<<< HEAD
	before_action :authenticate_user! 
=======
	before_action :authenticate_user! 	
>>>>>>> origin/master

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





end
