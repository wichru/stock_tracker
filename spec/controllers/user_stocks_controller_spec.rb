require 'rails_helper'

RSpec.describe UserStocksController, type: :controller do
  let(:user) { User.new(email: 'test@example.com', password: 'password').save }

  before do
    sign_in(user)
  end

  describe 'GET #create' do
    context 'when user provide valid params' do
      it 'create stock' do
        expect do
          post :create, params: { stock_ticker: 'GE' }
        end.to change(Stock, :count).by(1)
        expect(response).to have_http_status(:redirect)
      end
    end

    it 'returns http success' do
      get :create
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'DELETE #destroy' do
    let(:stock) { Stock.new_from_lookup('GS') }
    let(:user_stock) { UserStock.create(user_id: user.id, stock: stock) }

    it 'deletes stock' do
      expect do
        delete "/user_stocks/#{user_stock.id}"
      end.to change(UserStock, :count).by(-1)
      expect(response).to have_http_status(redirect)
      expect(flash[:notice]).to eq 'Stock successfully removed'
    end
  end
end
