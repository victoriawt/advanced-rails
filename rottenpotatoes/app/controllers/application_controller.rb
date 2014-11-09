class ApplicationController < ActionController::Base
 protect_from_forgery  
 before_filter :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    # we exploit the fact that find_by_id(nil) returns nil
    @current_user ||= Moviegoer.find_by_id(session[:user_id])
   #redirect_to login_path and return unless @current_user
  end
 private
  if Rails.env.test?
    prepend_before_filter :stub_current_user
    def stub_current_user
      session[:user_id] ||= cookies[:stub_user_id] 
    end
  end
end




