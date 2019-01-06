require 'rails_helper'

RSpec.describe StocksController, type: :controller do
  let(:user) { User.new(email: 'test@example.com', password: 'password') }
  let(:stock) { StockQuote::Stock.quote(symbol) }

  before { sign_in(user) }

  describe 'GET#search' do
    context 'when user entered valid params' do
      let(:symbol) { 'GOOG' }

      it 'allows to search ticker' do
        expect(stock.company_name).to eq 'Alphabet Inc.'
      end

      it 'shows valid ticker' do
        expect(stock.symbol).to eq 'GOOG'
      end
    end

    context 'when user entered invalid params' do
      let(:symbol) { 'abcdefg' }

      it 'shows error message and redirect' do
        expect(flash[:danger]).to eq "Ticker doesn't exist"
      end

      it "doesn't allow to search" do

      end
    end
  end
end
