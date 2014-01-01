class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :user_avatar
  
  has_secure_password

  mount_uploader :user_avatar, UserAvatarUploader
  
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :messages, class_name: 'Message', foreign_key: 'user_id'
  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token 

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password,  length: { minimum: 6 }
  validates :password_confirmation, presence: true



  def following?(other_user)
    self.relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end
  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
  def feed
    # self.microposts
    microposts.where("user_id = ?", id)
  end
  
  def full_name
    return "#{self.first_name} #{self.last_name}"
  end

  def prefix
    try(:full_name) || email
  end

  def message_title
    "#{prefix} <#{email}>"
  end

  def to_s
    full_name
  end

  def mailbox
    Mailbox.new(self)
  end

  private
  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end
end
