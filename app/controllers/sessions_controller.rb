class SessionsController < ApplicationController
  skip_before_action :require_user, only: :create

  def create
    user = User.find_by(email: params["users"]["email"])

    respond_to do |format|
      if user && user.authenticate(params["users"]["password"])
        create_user_session user
        format.json { render json: user, status: :ok }
      else
        message = "invalid email or password"
        format.json { render json: { error: message }, status: :not_found }
      end
    end
  end

  def destroy
    destroy_user_session

    respond_to do |format|
      format.json { render json: { message: "success" }, status: :ok }
    end
  end
end
