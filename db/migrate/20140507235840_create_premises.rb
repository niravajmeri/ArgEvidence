class CreatePremises < ActiveRecord::Migration
  def change
    create_table :premises do |t|
      t.integer :scheme_id
      t.integer :premise_type_id
      t.text :description

      t.timestamps
    end
  end
end
