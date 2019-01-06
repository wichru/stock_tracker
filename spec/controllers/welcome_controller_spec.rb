require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    let(:user) { User.create(email: 'foo@example.com', password: 'password') }
    before { sign_in(user) }

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

end
