class AddArgumentIdToInferenceRules < ActiveRecord::Migration
  def change
    add_column :inference_rules, :argument_id, :integer
  end
end
