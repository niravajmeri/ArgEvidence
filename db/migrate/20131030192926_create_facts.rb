class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :description

      t.timestamps
    end
  end
end
