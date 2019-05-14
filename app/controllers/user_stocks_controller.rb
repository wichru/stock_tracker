class UserStocksController < ApplicationController
  def create
    @user_stock = UserStocksCreator.new(current_user, params, flash).call
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy!
    flash[:notice] = 'Stock successfully removed'
    # UserStocksDestroyer.new(current_user, params, flash)
    redirect_to my_portfolio_path
  end
end
