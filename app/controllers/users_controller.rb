class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # def create
  #   binding.pry
  #   @user = User.create(user_params)
  # end

end
