class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  def layout
    devise_controller? ? 'devise' : 'application'
  end
end
