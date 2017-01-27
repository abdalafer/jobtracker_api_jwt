require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/:id" do
    it "fails to authenticate with jwt" do
      user = FactoryGirl.create(:user)
      jwt = 'wrongtoken'

      #get "/users/#{user.id}"
      get "/users/#{user.id}", headers: { 'Authorization' => "Bearer #{jwt}" }
      response.code.should eq('401')
      expect(response).to have_http_status(:unauthorized)
    end

    it "authenticates with jwt" do
      user = FactoryGirl.create(:user)
      jwt = user.jwt = JWTWrapper.encode(user.slice(:id, :email))

      #get "/users/#{user.id}"
      get "/users/#{user.id}", headers: { 'Authorization' => "Bearer #{jwt}" }
      expect(response).to have_http_status(:success)

    end
  end

  describe "POST /users" do
    it "creates a new user" do
      user_params = {user: {full_name: 'test user', email: 'test@email.com', password: '12345'}}
      post users_path, params: user_params
      api_response.should include('jwt')
      api_response['jwt'].should_not eq('')
    end
  end

  describe "POST /users/login" do
    it "logs in user" do
      user_params = {user: {email: 'test@email.com', password: '12345'}}
      FactoryGirl.create(:user, email: 'test@email.com', password: '12345')
      post '/users/login', params: user_params
      response.code.should eq('200')
      api_response.should include('jwt')
      api_response['jwt'].should_not eq(nil)
    end
  end

end
