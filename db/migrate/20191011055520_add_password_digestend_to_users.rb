class AddPasswordDigestendToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_digestend, :string
  end
end
