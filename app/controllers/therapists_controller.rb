# frozen_string_literal: true

class TherapistsController < ApplicationController
  before_action :current_patient, only: [:index]
  before_action :set_therapist, only: %i[show edit update destroy]

  def index
    @therapists = Therapist.all
    @hash = Gmaps4rails.build_markers(@therapists) do |therapist, marker|
      marker.lat therapist.latitude
      marker.lng therapist.longitude
    end
    @current_therapist = Therapist.find_by_user_id(current_user.id) if current_user.id.present?
    @current_appointments = Appointment.where(therapist_id: @current_therapist.id) if @current_therapist.present?
  end

  def show
    @current_patient = Patient.find_by_user_id(current_user.id)
  end

  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = Therapist.new(therapist_params)
    @therapist.user_id = current_user.id

    respond_to do |format|
      if @therapist.save
        format.html { redirect_to therapists_path(@therapist) }
        format.json { render :show, status: :created, location: @therapist }
      else
        format.html { render :new }
        format.json { render json: @therapist.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @therapist.update(therapist_params)
        format.html { redirect_to therapists_path }
        format.json { render :show, status: :ok, location: @therapist }
      else
        format.html { render :edit }
        format.json { render json: @therapist.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def therapist_params
    params.require(:therapist).permit(:user_id, :name, :contact_no, :specialization,
                                      :age, :available_time_to, :available_time_from,
                                      :degree, :experience, :gender, :email, :address,
                                      :latitude, :longitude, available_days: [])
  end

  def set_therapist
    @therapist = Therapist.find(params[:id])
  end

  def current_patient
    @current_patient = Patient.find_by_user_id(current_user.id)
  end
end
