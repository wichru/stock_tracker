class UserStocksCreator
  def initialize(current_user, params, flash)
    @current_user = current_user
    @params = params[:stock_ticker]
    @flash = flash
  end

  def call
    stock = Stock.find_by_ticker(params)
    if stock.blank?
      stock = Stock.new_from_lookup(params)
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{@user_stock.stock.name} was successfully added to portfolio"
  end

  private

  attr_accessor :current_user, :params, :flash
end
