class OrdersController < ApplicationController
  
  def index

  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to action: :index
  end


  private

  def order_params
    params.require(:order).merge(user_id: current_user.id, display_id: params[:display_id])
  end

  def address
    params.permit(:postcode, :city, :block, :building, :phone_number)
  end

end
