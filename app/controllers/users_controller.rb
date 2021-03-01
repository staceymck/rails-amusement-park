require 'pry'

class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  
  def index
    @users = User.all
  end

  #get '/users/new'
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path, alert: "Unable to create account"
    end
  end

  #get '/users/:id'
  def show
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end
end