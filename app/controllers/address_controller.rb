class AddressController < ActionController::Base
  
  def show
    @address = Address.find(params[:id])
    respond_to do |format|
      format.json { render json: @address }
    end
  end
  
end
