class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = 'You entered an empty ticker'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Ticker doesn't exist" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end
