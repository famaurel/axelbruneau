class Article < ApplicationRecord
  has_one :category
  has_many :comments, dependent: :destroy
  has_many :attached_images, dependent: :destroy
end
