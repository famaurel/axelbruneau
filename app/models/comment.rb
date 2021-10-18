class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :content, presence: true
end
