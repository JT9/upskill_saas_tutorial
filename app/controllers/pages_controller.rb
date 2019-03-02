class PagesController < ApplicationController
  #GET request for / which is our home page
  #action name for corresponding folder for home in views/pages
  def home
    #instance vars can be used inside view files
    @basic_plan = Plan.find(1)
    @pro_plan = Plan.find(2)
  end
  
  def about
  end
end