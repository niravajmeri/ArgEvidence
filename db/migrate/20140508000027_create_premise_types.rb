class CreatePremiseTypes < ActiveRecord::Migration
  def change
    create_table :premise_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
