class UserStocksController < ApplicationController
  def create
    @user_stock = UserStocksCreator.new(current_user, params, flash).call
    redirect_to my_portfolio_path
  end

  def destroy
    UserStocksDestroyer.new(current_user, params, flash).call
    redirect_to my_portfolio_path
  end
end
