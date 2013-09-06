class RemoveEvidenceIdFromArgumentEvidence < ActiveRecord::Migration
  def up
    remove_column :argument_evidences, :evidence_id
    remove_column :argument_evidences, :number
  end

  def down
    add_column :argument_evidences, :number, :string
    add_column :argument_evidences, :evidence_id, :string
  end
end
