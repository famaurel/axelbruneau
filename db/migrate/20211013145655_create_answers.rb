class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :content
      t.boolean :published, default: false
      t.integer :user_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
