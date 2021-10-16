class AddArticleReferencesToCategories < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :comment, index: true
  end
end
