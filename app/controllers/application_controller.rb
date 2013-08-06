class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def print_logger_info parameter
    logger.info "######{" Controller : "+params[:controller]+" "}#################{" Action : "+params[:action]+" "}###########{" Parameters : "+parameter.inspect+" "}#############}" if Rails.env.development?    
  end

  def after_sign_in_path_for(resource)
    polls_path
  end
end
