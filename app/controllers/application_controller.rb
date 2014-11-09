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
    if !@current_user
      redirect_to new_session_path
    end
  end
  
  def setupuser
    if !session[:user_id]
    else
      @current_user = User.find(session[:user_id])
    end
  end
  
  def login_to_top(user)
     # 認証成功したらセッションに保存してTOPへリダイレクト
     session[:user_id] = user.id
     redirect_to top_index_path    
  end  
  
  def isuser
     if session[:user_id]
       redirect_to :controller => "top"
     end
  end

end
