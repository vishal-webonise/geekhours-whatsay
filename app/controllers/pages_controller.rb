class PagesController < ApplicationController
  before_filter :send_signed_in_user_to_polls, only: [:index]

  def index
  end

  def after_login
  end

  def ask_poll
  end  

  private
  def send_signed_in_user_to_polls
    redirect_to :polls if user_signed_in?
  end
end