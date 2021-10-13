class Comment < ApplicationRecord
  belongs_to :article
  has_one :user
  has_many :answers, dependent: :destroy
end
