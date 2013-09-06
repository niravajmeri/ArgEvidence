class Evidence < ActiveRecord::Base
  belongs_to :user
  has_many :argument_evidences
  has_many :arguments, :through => :argument_evidences
  accepts_nested_attributes_for :arguments
  attr_accessible :description, :mass_value, :title, :user_id, :argument_ids, :argument_evidences
end
