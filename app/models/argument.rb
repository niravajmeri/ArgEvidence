class Argument < ActiveRecord::Base
  belongs_to :user
  has_many :argument_evidences
  has_many :evidences, :through => :argument_evidences
  accepts_nested_attributes_for :evidences
  attr_accessible :description, :title, :user_id, :argument_evidences, :evidence_ids
end
