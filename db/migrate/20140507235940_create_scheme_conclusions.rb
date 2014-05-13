class CreateSchemeConclusions < ActiveRecord::Migration
  def change
    create_table :scheme_conclusions do |t|
      t.integer :scheme_id
      t.text :description

      t.timestamps
    end
  end
end
