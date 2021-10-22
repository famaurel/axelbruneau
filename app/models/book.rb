class Book < ApplicationRecord
  has_rich_text :title
  has_rich_text :description
end
