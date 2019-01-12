require 'rails_helper'

RSpec.describe Stock, type: :model do
  it { should have_many(:users).through(:user_stocks) }
  it { should have_many(:user_stocks) }

  describe 'Searching stocks' do

    it 'finds stock by ticker' do
      Stock.create(ticker: 'GS')
      expect(Stock.find_by_ticker('GS')).not_to eq nil
    end

    it 'returns stock details' do
      stock = Stock.new_from_lookup('GS')
      expect(stock).to_not eq nil
    end
  end
end
