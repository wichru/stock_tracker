class UserStocksDestroyer
  def initialize(current_user, params, flash)
    @current_user = current_user
    @params = params[:id]
    @flash = flash
  end

  def call
    stock = Stock.find(params)
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy!
    flash[:notice] = 'Stock successfully removed'
  end

  private

  attr_reader :current_user, :params, :flash
end
