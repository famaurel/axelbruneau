class Answer < ApplicationRecord
  has_one :user
  belongs_to :comment
end
