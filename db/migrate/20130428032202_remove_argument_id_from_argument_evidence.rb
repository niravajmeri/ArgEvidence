class RemoveArgumentIdFromArgumentEvidence < ActiveRecord::Migration
  def up
    remove_column :argument_evidences, :argument_id
  end

  def down
    add_column :argument_evidences, :argument_id, :string
  end
end
