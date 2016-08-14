class MainController < ApplicationController
  skip_before_action :require_user, only: :index

  def index
  end

  def dashboard
  end
end
