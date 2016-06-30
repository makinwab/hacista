class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    respond_to do |format|
      if user
        format.json { render json: user, status: :created }
      else
        format.json { render json: user.errors, status: 422 }
      end
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :email, :username, :password)
  end
end
