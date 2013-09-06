class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
