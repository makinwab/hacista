require "rails_helper"

RSpec.describe SessionsController, type: :request do
  describe "POST /api/users/auth" do
    before(:each) { create(:user) }

    context "when the user exists" do
      before(:all) do
        post "/api/users/auth", users: attributes_for(:valid_auth)
      end

      let(:valid_user) { attributes_for(:valid_auth) }

      it "returns serialized user data" do
        user = JSON.parse(response.body)
        id64 = %r(^(?:[A-Za-z0-9+\/]{4}\n?)*(?:[A-Za-z0-9+\/]{2}==|
        [A-Za-z0-9+\/]{3}=)?$)

        expect(user["id"]).to match id64
        expect(user["email"]).to eql valid_user[:email]
      end

      it "returns a 200 http status code" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the user does not exist" do
      before(:all) do
        post "/api/users/auth", users:  attributes_for(:invalid_auth)
      end

      let(:invalid_user) { attributes_for(:invalid_auth) }

      it "returns an error message" do
        message = JSON.parse(response.body)
        expect(message["error"]).to eql "invalid email or password"
      end

      it "returns a 404 http status code" do
        expect(response).to have_http_status(404)
      end
    end
  end
end
