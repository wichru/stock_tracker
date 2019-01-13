require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password') }

  before do
    sign_in(user)
  end

  describe "GET #my_portfolio" do
    it "returns http success" do
      get :my_portfolio
      expect(response).to have_http_status(:success)
    end
  end

end
