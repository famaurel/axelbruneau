class Article < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :answers, :through => :comments
  has_rich_text :content
end
