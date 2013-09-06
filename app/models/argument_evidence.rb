class ArgumentEvidence < ActiveRecord::Base
  attr_accessible :argument_id, :evidence_id
  belongs_to :argument
  belongs_to :evidence
  #accepts_nested_attributes_for :evidences
  #accepts_nested_attributes_for :arguments
  validates :evidence_id, :uniqueness => {:scope => :argument_id}
end
