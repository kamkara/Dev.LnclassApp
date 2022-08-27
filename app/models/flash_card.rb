class FlashCard < ApplicationRecord
  belongs_to :course
  belongs_to :user

  #Slugged concern
  include ItemsSlugged

  #setup validation and uniqueness
  validates :slug, :user_id, :course_id, presence: true
  validates :title, presence: true, uniqueness: { scope: :course_id }



end
