class Article < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :destroy
end
