class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pins 
  has_many :boards
  has_many :reviews
  validates_uniqueness_of :username

  has_attached_file :avatar, styles:  { medium: "100x100>", thumb: "100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  def follow_relation user_id
	  	return UserRelations::SELF if id == user_id
	  	if FollowMapping.where(:followee_id => user_id, :follower_id => id).length > 0
	  		return UserRelations::FOLLOWED
	  	else
	  		return UserRelations::NOTFOLLOWED
	  	end
  	end

   def can_follow user_id
  	return follow_relation(user_id) == UserRelations::NOTFOLLOWED
   end

   def can_un_follow user_id
    return follow_relation(user_id) == UserRelations::FOLLOWED
   end

    def followee_ids
     FollowMapping.where(follower_id: id).pluck(:followee_id)
    end

   class UserRelations
  	SELF = 0
  	FOLLOWED = 1
 	NOTFOLLOWED = 2
   end
   
end
