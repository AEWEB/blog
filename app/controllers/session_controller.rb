class SessionController < ApplicationController
  skip_filter :has_session
  
  before_filter :login?,:only => [:new, :create]
  
  TEMPMAIL = "TEMPMAILMAIL@jo.jp"
  def index
    redirect_to new_session_path
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(params.require(:user).permit(:nickname, :password))
    if !@user.valid?
    elsif User.login(@user)
      login_to_top(@user)
      return
    end
    render :new
  end
  
  def destroy
    reset_session
    redirect_to :action => 'new'
  end
end
