class SessionsController < ApplicationController

  #filtro antes de logout y exclusivo
  before_filter :login_required, :only => [:logout] 

  def new
  end

  def create
  	# User.find_by_email_and_password
  	# o
  	# User.where(e,p)
  	# o
  	# @user = User.find_by_email e
  	# if @user.password === password
  	# end

  	@user = User.find_by_email(params[:email])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
      redirect_to products_path
    else
      flash[:error] = "Error clasico"
      flash.now.notice = "Password incorrecta"
      render :new
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, :notice => "Logged out"
  end
end
