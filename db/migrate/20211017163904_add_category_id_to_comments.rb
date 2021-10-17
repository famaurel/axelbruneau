class AddCategoryIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :category_id, :integer
  end
end
