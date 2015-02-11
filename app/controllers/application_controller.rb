class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  protect_from_forgery
  before_filter :has_session
  
  
  private
  
  # ユーザがログイン状態かどうか
  def has_session
    setupuser
    unless @current_user
      session[:user_id] = nil
      redirect_to new_session_path
    end
  end
  
  def setupuser
    @current_user = User.find_by(id:session[:user_id]) if session[:user_id]
  end
  
  def login_to_top(user)
     session[:user_id] = user.id
     redirect_to top_index_path    
  end  
  
  def login?
     redirect_to :controller => "top" if session[:user_id]
  end

end
