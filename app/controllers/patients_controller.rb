class PatientsController < ApplicationController
  before_action :load_entity, only: %i[show edit update destroy]

  def index
    @therapists = Therapist.where.not(latitude: nil, longitude: nil)
    @therapists = Therapist.all
    @patients = Patient.all
    @current_patient = Patient.find_by_user_id(current_user.id)

    @geojson = build_geojson
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
    @patient_appointments = Appointment.where(patient_id: params[:data])
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
