class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.string :title
      t.text :description
      t.integer :mass_value
      t.integer :user_id
      t.integer :argument_id

      t.timestamps
    end
  end
end
