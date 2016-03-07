class StocksController < ApplicationController
  def create
    @stock = current_user.stocks.new(stock_params)
    @stock.save
  end

  def destroy
    @stock = current_user.stocks.find(params[:id])
    @stock.destroy
  end

  private
  def stock_params
    params.require(:stock).permit(:item_id)
  end

end
