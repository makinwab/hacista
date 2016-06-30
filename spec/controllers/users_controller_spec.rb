require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "POST /api/users" do
    it "returns http success" do
      post "/api/users", { users: attributes_for(:user) }
      expect(response).to have_http_status(:created)
    end
  end

end
