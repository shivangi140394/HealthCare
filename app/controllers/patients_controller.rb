class PatientsController < ApplicationController
  # before_action :load_entities

  def index
    @therapists = Therapist.all
    @patients = Patient.all
    @current_patient = Patient.find_by_user_id(current_user.id)
  end

  def show
    @patient = Patient.find(params[:id])
    @current_therapist = Therapist.find_by_user_id(current_user.id)
    @appointment = Appointment.find_by(id: params[:data])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new patient_params
    @patient.user_id = current_user.id
    if @patient.save
      flash[:success] = "Patient #{@patient.name} was register successfully"
      redirect_to patients_path(@patient)
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:success] = "Patient #{@patient.name} was updated successfully"
      redirect_to patients_path
    else
      render :new
    end
  end

  def patient_appointments
    @patient_appointments = Appointment.where(patient_id: params[:data])
  end

  protected

  def patient_params
    params.require(:patient).permit(:user_id, :name, :phone, :address, :city, :email,
                                    :state, :gender, :description, images: [])
  end
end
