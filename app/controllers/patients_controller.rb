class PatientsController < ApplicationController
before_action :set_hospital
before_action :set_patient, only:[:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show
    @meds = @patient.meds
  end

  def new
    @patient = @hospital.patients.new
  end

  def create
    @patient = @hospital.patients.create patient_params
    redirect_to hospital_path(@hospital)
  end

  def edit
  end

  def update
    @patient.update_attributes (patient_params)
      redirect_to hospital_patients_path
  end

  def destroy
    @patient.delete
    redirect_to hospital_patients_path
  end

private
    def patient_params
      params.require(:patient).permit(
        :first_name,
        :last_name,
        :date_of_birth,
        :description,
        :gender,
        :blood_type
        )
    end

    def set_hospital
      @hospital = Hospital.find params[:hospital_id]
    end

    def set_patient
      @patient = Patient.find params[:id]
    end
      
  
end
