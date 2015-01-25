class MedsController < ApplicationController
 before_action :set_med                                     

  def index
    # @patient = Patient.find params[:patient_id]
    @meds = @patient.meds
  end

  def show
    # @hospital = Hospital.find params[:hospital_id]
    @med = Med.find params[:id]
  end

  def new
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = Patient.find params[:patient_id]
    @med = @patient.meds.new 
  end

  def create
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = Patient.find params[:patient_id]
    @patient.meds.create med_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def edit
    @med = Med.find params[:id]
  end

  def update
    @med = Med.find params[:id]
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = Patient.find params[:patient_id]
    @med.update_attributes med_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def destroy
    @med = Med.find params[:id]
    @med.delete
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = Patient.find params[:patient_id]
    redirect_to hospital_patient_path(@hospital, @patient)
  end

private
  def med_params
    params.require(:med).permit(
        :med_name,
        :med_class,
        :med_dosage,
        :med_use,
        )
    end

  def set_med
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.find params[:patient_id]
    
  end

end
