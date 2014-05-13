class AddSchemeIdToArguments < ActiveRecord::Migration
  def change
    add_column :arguments, :scheme_id, :integer
  end
end
