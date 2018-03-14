class Board < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :pins
	validates_presence_of :name
end
