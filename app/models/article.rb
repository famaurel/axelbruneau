class Article < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :answers, :through => :comments
  accepts_nested_attributes_for :comments
  has_many_attached :images, dependent: :destroy
  has_rich_text :content
end
