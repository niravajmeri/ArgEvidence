class User < ActiveRecord::Base
  #attr_accessible :email, :name, :password_hash, :password_salt, :user_id

  has_many :arguments
  has_many :evidences

  has_many :project_users
  has_many :projects, :through => :project_users

  attr_accessible :email, :password, :password_confirmation, :project_users, :project_ids
  accepts_nested_attributes_for :projects

  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
