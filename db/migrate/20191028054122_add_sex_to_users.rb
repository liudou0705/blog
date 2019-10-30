class AddSexToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sex, :string
    add_column :users, :birthday, :datetime
    add_column :users, :category, :integer
  end
end
