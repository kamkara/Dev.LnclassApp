class HomeController < ApplicationController
  before_action :authenticate_user!#, only: %i[index ]
  
  def index
    @FeedCourses = Course.feed.all_ordered
    #Create Flash from Course show
    #@flash = flash.include(@FeedCourses)
    
  end
end
