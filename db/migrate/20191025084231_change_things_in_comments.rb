class ChangeThingsInComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_id, :integer
    remove_column :comments, :username
    remove_column :comments, :email
  end
end
