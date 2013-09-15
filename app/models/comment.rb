class Comment < ActiveRecord::Base
  attr_accessible :content, :username
  validates :content, :presence => true
  belongs_to :mocropost
end
