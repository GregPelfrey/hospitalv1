class HospitalsController < ApplicationController
before_action :set_hospital, only:[:show, :edit, :update, :destroy]

  def index
    @hospitals = Hospital.all 
  end

  def new
    @hospital = Hospital.new
  end

  def edit
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
    flash[:notice] = "Hospital was successfully added"
    redirect_to hospitals_path
    else
      flash[:error] = "Hospital was not added!"
      render :new
    end
  end

   def show
      @patients = @hospital.patients
    end

  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html {redirect_to @hospital, notice: "Hospital Information Was Updated!"}
        format.json {render :show, status: :ok, location: @hospital }
      else
        format.html {render :edit}
        format.json {render json: @hospital.errors, status: :unprocessable_entity }
      end
  end
end

  def destroy
    @hospital.destroy
      respond_to do |format|
      format.html {redirect_to hospitals_url, notice: "Hospital was Removed!!"}
      format.json {head :no_content }
      end      
  end

  private
  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(
      :name,
      :address1,
      :address2,
      :city,    
      :state,   
      :zip,     
      :phone
    )
  end

end

