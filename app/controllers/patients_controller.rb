class PatientsController < ApplicationController
  before_action :load_entity, only: %i[show edit update destroy]
  # before_action :therapists_restric 

  def index
    @therapists = Therapist.all
    @patients = Patient.all
    @current_patient = Patient.find_by_user_id(current_user.id)
    current_login_user
  end

  def show
    @current_therapist = Therapist.find_by_user_id(current_user.id)
    @appointment = Appointment.find_by(id: params[:data])
    current_login_user
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new patient_params
    @patient.user_id = current_user.id

    respond_to do |format|
      if @patient.save
        format.html { redirect_to patients_path(@patient),
                      notice: "Patient #{@patient.name} was register successfully." }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patients_path, notice: "Patient #{@patient.name} was updated successfully." }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def patient_appointments
    if params[:locale].present?
      @patient_appointments = Appointment.where(patient_id: params[:patient_id], status: params[:locale])
    else
      @patient_appointments = Appointment.where(patient_id: params[:patient_id])
    end
    current_login_user
  end

  def therapists
    @therapists = Therapist.all
    current_login_user
  end

  def show_therapist
    @show_therapist = Therapist.find_by(id: params[:id])
    current_login_user
  end

  protected

  def load_entity
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:user_id, :name, :phone, :address, :city, :email,
                                    :state, :gender, :description, images: [])
  end
end
