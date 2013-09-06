class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :user_id, :string
  end
end
