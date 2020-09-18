class SessionsController < ApplicationController
  include SessionsHelper
  before_action :set_user, only: [:create]
  before_action :set_redirect_path, only: [:new]

  def create
    return redirect_to root_path, flash: { warning: "Already logged in." } if current_user.present?
    begin
      user = @user && @user.authenticate(params[:login][:password])
    rescue BCrypt::Errors::InvalidHash
      render "new", flash: { danger: "Sometyhing went Wrong" }
      return
    end
    
    if user
      User.generate_auth_token(:auth_token, @user)
      if params[:remember_me]
          login_with_remember_me(@user)
        else
          login(@user)
        end
      if @user.admin
        redirect_to overview_path, flash: { success: "Welcome #{@user.name}."}
      else
        redirect_to root_path, flash: { warning: "Welcome #{@user.name}." }
      end
    else
      render "new", flash: { danger: "Invalid credentials" }
    end
  end  
  
  def destroy
    logout
    redirect_to root_path, flash: { success: "Logout successfull" }
  end

  def new
    return redirect_to root_path, flash: { warning: "Already logged in" } if current_user.present?
  end  

  private
  
  def set_redirect_path
    session[:return_to] = request.referer
  end
  def set_user
    @user = User.find_by_email(params[:login][:email])
  end
end
