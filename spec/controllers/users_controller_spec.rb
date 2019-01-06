require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #my_portfolio" do
    it "returns http success" do
      get :my_portfolio
      expect(response).to have_http_status(:success)
    end
  end

end
