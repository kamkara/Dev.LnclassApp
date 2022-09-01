class FlashCard < ApplicationRecord
  belongs_to :course
  belongs_to :user

  
  #setup validation and uniqueness
  validates :slug, :user_id, :course_id, presence: true
  validates :title, presence: true, uniqueness: { scope: :course_id }
  
  #Slugged concern
  include ItemsSlugged


end
