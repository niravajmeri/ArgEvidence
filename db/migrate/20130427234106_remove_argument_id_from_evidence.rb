class RemoveArgumentIdFromEvidence < ActiveRecord::Migration
  def up
    remove_column :evidences, :argument_id
  end

  def down
    add_column :evidences, :argument_id, :number
  end
end
