class UsersController < ApplicationController
  skip_before_action :require_user, only: :create

  def create
    user = User.new(user_params)

    respond_to do |format|
      if user.save
        create_user_session user
        format.json { render json: user, status: :created }
      else
        format.json { render json: user.errors.to_json, status: 422 }
      end
    end
  end

  def show
    respond_to do |format|
      format.json { render json: current_user, status: :ok}
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :email, :username, :password)
  end
end
