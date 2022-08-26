class DashboardController < ApplicationController
   before_action :authenticate_user!
  
  def index
  end

  def home
    @LevelList = Level.all_desc
    @CityList = Citytown.all_desc
    @MaterialList = Material.all_desc
    @SchoolList = School.all_desc
  end
end
