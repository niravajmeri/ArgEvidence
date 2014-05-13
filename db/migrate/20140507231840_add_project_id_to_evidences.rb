class AddProjectIdToEvidences < ActiveRecord::Migration
  def change
    add_column :evidences, :project_id, :integer
  end
end
