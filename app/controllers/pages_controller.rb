class PagesController < ApplicationController
  #make sure user is logged in to be able to view the dash board
  before_action :authenticate_user!, only: [:dashboard]
  
  def home
    #if there is a current_user, we should redirect them from the :home view to our :dashboard
    if current_user
      redirect_to dashboard_path
    end
  end
  
  def dashboard
    @user = current_user
    @reviews = @user.reviews
    @places = @user.places
  end
end
