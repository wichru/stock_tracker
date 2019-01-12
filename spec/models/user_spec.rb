require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_stocks) }
  it { should have_many(:stocks).through(:user_stocks) }

  describe 'Full name' do
    subject = User.new(first_name: 'John', last_name: 'Doe')

    it "returns user's full name" do
      expect(subject.full_name).to eq 'John Doe'
    end

    it 'return Anonymous expression' do
      subject.first_name = nil
      subject.last_name = nil
      expect(subject.full_name).to eq 'Anonymous'
    end
  end

  describe 'Add stock' do
    user = User.create(email: 'test@example.com', password: 'password')

    context 'when user add the same stock' do
      let(:stock) { Stock.new(name: 'Goldman Sachs', ticker: 'GS', last_price: 112.4) }

      it "return false" do
        user_stocks = UserStock.new(user: user, stock: stock)
        expect(user_stocks.can_add_stock?('GS')).to eq true
      end
    end
  end
end
