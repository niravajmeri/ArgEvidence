class CreateInferenceRules < ActiveRecord::Migration
  def change
    create_table :inference_rules do |t|
      t.string :description

      t.timestamps
    end
  end
end
