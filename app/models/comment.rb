class Comment < ApplicationRecord
  has_one :article
  has_one :user
  has_many :answers, dependent: :destroy
end
