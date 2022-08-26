class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[index ]
  def index
    @FeedCourses = Course.feed.all_desc
  end
end
