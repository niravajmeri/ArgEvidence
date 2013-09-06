class AddArgumentIdAndEvidenceIdToArgumentEvidence < ActiveRecord::Migration
  def change
    add_column :argument_evidences, :argument_id, :integer
    add_column :argument_evidences, :evidence_id, :integer
  end
end
