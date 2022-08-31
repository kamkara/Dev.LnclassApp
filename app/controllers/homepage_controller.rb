class HomepageController < ApplicationController
  before_action :authenticatify?

  def index
  end

  private

  def authenticatify?
    if user_signed_in?
      redirect_to feed_path
    end
  end
end
