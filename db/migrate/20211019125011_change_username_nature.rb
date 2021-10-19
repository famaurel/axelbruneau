class ChangeUsernameNature < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :username, :text
  end
end
