class OrdersController < ApplicationController
  
  def index
  end

  def new
    @address = Address.new
  end

  def create
  @address = Address.new(order_params)

   if @address.valid? 
    @address.save
    redirect_to action: :index
   else
    render action: :new
   end
  end


  private

  def order_params
    params.require(:address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
  end
end
