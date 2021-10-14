class DeleteContentFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :content
  end
end
