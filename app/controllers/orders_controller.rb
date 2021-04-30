class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :display_params, only: [:index, :create]

  def index
    @order = Order.new
    if current_user == @display.user
      redirect_to root_path 
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      pay_item
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:postcode, :city, :prefecture_id, :block, :building, :phone_number).merge(
      display_id: params[:display_id], user_id: current_user.id, token: params[:token]
    )
  end

  def display_params
    @display = Display.find params[:display_id]
  end
  
  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @display.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
