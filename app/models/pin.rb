class Pin < ActiveRecord::Base
	acts_as_votable
	acts_as_taggable 
	belongs_to :user
	belongs_to :board
	has_many :reviews
	has_attached_file :image, styles:  { medium: "300x300>", thumb: "100x100" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
