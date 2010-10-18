class ApplicationController < ActionController::Base
  protect_from_forgery

  def only_admin
    unless current_user && current_user.admin?
      redirect_to new_session_path(:user), :notice => "You must be admin to access this page"
    end
  end
end
