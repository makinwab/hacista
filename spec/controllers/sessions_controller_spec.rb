require "rails_helper"

RSpec.describe SessionsController, type: :request do
  describe "POST /api/users/auth" do
    before(:each) { create(:user) }

    context "when the user exists" do
      it "returns serialized user data and http status" do
        valid_user = attributes_for(:valid_auth)
        post "/api/users/auth", users: valid_user

        user = JSON.parse(response.body)
        id64 = %r(^(?:[A-Za-z0-9+\/]{4}\n?)*(?:[A-Za-z0-9+\/]{2}==|
        [A-Za-z0-9+\/]{3}=)?$)

        expect(user["id"]).to match id64
        expect(user["email"]).to eql valid_user[:email]
        expect(response).to have_http_status(200)
      end
    end

    context "when the user does not exist" do
      it "returns serialized an error message and http status" do
        invalid_user = attributes_for(:invalid_auth)
        post "/api/users/auth", users: invalid_user
        message = JSON.parse(response.body)

        expect(message["error"]).to eql "invalid email or password"
        expect(response).to have_http_status(404)
      end
    end
  end
end
