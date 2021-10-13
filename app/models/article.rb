class Article < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :attached_images, dependent: :destroy
end
