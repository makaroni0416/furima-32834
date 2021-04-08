class DisplaysController < ApplicationController
 
  
  def index
  end

  def new
    @display = Display.new
  end

  def create
    Display.create(display_params)
  end

  private
  def display_params
    params.require(:display).permit(:product, :product_text, :category_id, :product_status_id, :delivery_price_id, :prefecture_id, :shipping_date_id, :price)
  end
end
