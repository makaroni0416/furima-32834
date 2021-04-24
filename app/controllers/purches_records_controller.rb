class PurchesRecordsController < ApplicationController
  def index
    @purches_records = PurchesRecords.all 
  end

  def new
    @purches_record =Purches_record.new
  end

  def create
    @purches_record = Purches_record(buy_records_params)
    if @purches_record
      redirect_to action: :index
    else
      render action: :new
    end
end

private

def buy_records_params
  params.require(:purches_record).permit(:user, :display)
end

end
