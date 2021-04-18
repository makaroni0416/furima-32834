class DisplaysController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  
  def index
    @display = Display.all.order("created_at DESC")

  end

  def new
    @display = Display.new
  end

  def show
    @display = Display.find(params[:id])
  end

  def create
    @display = Display.new(display_params)

    if @display.valid?
       @display.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def display_params
    params.require(:display).permit(:product, :product_text, :category_id, :product_status_id, :delivery_price_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
