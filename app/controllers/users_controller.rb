class UsersController < ApplicationController

  def edit
  	@users = User.all
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  	@title = 'Sign Up'
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      redirect_to login_path, :notice => "Signed up!  Now you can log in with your new account."
    else
      render "new"
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
 
    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end

  
end
