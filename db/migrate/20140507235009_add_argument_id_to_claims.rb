class AddArgumentIdToClaims < ActiveRecord::Migration
  def change
    add_column :claims, :argument_id, :integer
  end
end
