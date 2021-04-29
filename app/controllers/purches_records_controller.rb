class PurchesRecordsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @purches_record = PurchesRecord.create(purches_record_params)
    Address.create(address_params)
    redirect_to action: :index
  end
end

private
def purches_record_params
  params.require(:purches_record).merge(user_id: current_user.id, display_id: params[:display_id])
end

def address_params(order)
  params.permit(:postcode, :city, :block, :building, :phone_number).merge(user_id: user.id)
end


end
