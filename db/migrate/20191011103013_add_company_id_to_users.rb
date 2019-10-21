class AddCompanyIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company_id, :integer
    remove_column :companies, :user_id
  end
end
