class DisplaysController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_display, only: [:show, :edit, :update]
  before_action :user_not_access, only: [:edit, :update]
  
  def index
    @display = Display.all.order("created_at DESC")
  end

  def new
    @display = Display.new
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

  def show
  end

  def edit
  end

  def update
    if @display.update(display_params)
      redirect_to display_path
    else
      render :edit
    end
  end

  def destroy
    @display = Display.find(params[:id])
    @display.destroy
    redirect_to root_path
  end




  private

  def display_params
    params.require(:display).permit(:product, :product_text, :category_id, :product_status_id, :delivery_price_id, :prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_display
    @display = Display.find(params[:id])
  end

  def user_not_access
    redirect_to root_path unless current_user.id == @display.user_id
  end


end
