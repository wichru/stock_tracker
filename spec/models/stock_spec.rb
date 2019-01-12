require 'rails_helper'

RSpec.describe Stock, type: :model do
  it { should have_many(:users).through(:user_stocks) }
  it { should have_many(:user_stocks) }
end
