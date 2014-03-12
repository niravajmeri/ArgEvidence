class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.string :description

      t.timestamps
    end
  end
end
