require "pry"
class UsersController < ApplicationController
  respond_to :json

  def create
    binding.pry
    #respond_with User.create(params[:user])
  end
end
