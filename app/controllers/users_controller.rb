class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    respond_to do |format|
      if user.save
        format.json { render json: user, status: :created }
      else
        format.json { render json: user.errors.to_json, status: 422 }
      end
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :email, :username, :password)
  end
end
