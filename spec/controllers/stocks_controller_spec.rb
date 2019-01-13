require 'rails_helper'

RSpec.describe StocksController, type: :controller do
  let(:user) { User.new(email: 'test@example.com', password: 'password') }
  let(:subject) { StockQuote::Stock.quote(symbol) }

  before { sign_in(user) }

  describe 'GET #search' do
    context 'when user entered valid params' do

      it 'allows to search ticker' do
        Stock.create(ticker: 'GOOG', name: 'Alphabet Inc.', last_price: 12)
        Stock.create(ticker: 'TSLA', name: 'Tesla Inc.', last_price: 20)
        Stock.create(ticker: 'GS', name: 'Goldman Sachs Group Inc. (The)', last_price: 40)

        get :search, params: { ticker: 'GOOG' }

        expect(response.body).to match_array(%w[GOOG TSLA GS])
      end
    end

    context 'when user entered invalid params' do
      it 'shows error message' do
        get :search, params: { stock: '' }
        expect(flash[:danger]).to eq 'You entered an empty ticker'
      end

      it 'shows error message and redirect' do
        get :search, params: { stock: 'xyzxcva'}
        expect(flash[:danger]).to eq "Ticker doesn't exist"
      end
    end
  end
end
