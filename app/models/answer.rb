class Answer < ApplicationRecord
  has_one :user
  has_one :comment
end
