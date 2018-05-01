class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]
  has_many :pins 
  has_many :boards
  has_many :reviews
  validates_uniqueness_of :username

  has_attached_file :avatar, styles:  { medium: "100x100>", thumb: "100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def feed
    users = followee_ids
    users << id
    Pin.where(user_id: users).order(created_at: :desc)
  end


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

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
    end

     def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


   class UserRelations
  	SELF = 0
  	FOLLOWED = 1
 	NOTFOLLOWED = 2
   end
   
end
