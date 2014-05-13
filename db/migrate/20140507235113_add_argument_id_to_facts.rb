class AddArgumentIdToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :argument_id, :integer
  end
end
