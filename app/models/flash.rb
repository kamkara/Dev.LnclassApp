class Flash < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_rich_text :content
end
