class AddProjectIdToArguments < ActiveRecord::Migration
  def change
    add_column :arguments, :project_id, :integer
  end
end
