class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params["users"]["email"])

    respond_to do |format|
      if user && user.authenticate(params["users"]["password"])
        format.json { render json: user, status: :ok }
      else
        message = "invalid email or password"
        format.json { render json: { error: message }, status: :not_found }
      end
    end
  end
end
