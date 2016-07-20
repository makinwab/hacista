require "rails_helper"

RSpec.describe UsersController, type: :request do
  describe "POST /api/users" do
    context "when user data is valid" do
      let(:valid_user) { attributes_for(:user) }

      before(:all) do
        post "/api/users", users: attributes_for(:user)
      end

      it "returns users' data and http created status" do
        user = JSON.parse(response.body)

        expect(user["name"]).to eql valid_user[:name]
        expect(user["email"]).to eql valid_user[:email]
      end

      it "returns http status code" do
        expect(response).to have_http_status(:created)
      end
    end

    context "when user data is invalid" do
      before(:all) do
        post "/api/users", users: attributes_for(:invalid_user)
      end

      let(:messages) { JSON.parse(response.body)}

      it "returns error message" do
        length_message = "is too short (minimum is 3 characters)"

        expect(messages["name"]).to include "can't be blank"
        expect(messages["email"]).to include "is invalid"
        expect(messages["username"]).to include length_message
        expect(messages["password"]).to include length_message
      end

      it "returns a 422 http status code" do
        expect(response).to have_http_status(422)
      end
    end
  end
end
