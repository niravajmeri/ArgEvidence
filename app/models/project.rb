class Project < ActiveRecord::Base


  has_many :arguments
  has_many :evidences
  has_many :project_users
  has_many :users, :through => :project_users
  accepts_nested_attributes_for :users
  attr_accessible :description, :name, :arguments, :evidences, :user_ids, :project_users

end
