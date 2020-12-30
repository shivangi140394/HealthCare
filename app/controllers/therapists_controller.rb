# frozen_string_literal: true

class TherapistsController < ApplicationController
  before_action :current_patient, only: [:index]

  def index
    @therapists = Therapist.all
    @current_therapist = Therapist.find_by_user_id(current_user.id) if current_user.id.present?
    @current_appointments = Appointment.where(therapist_id: @current_therapist.id) if @current_therapist.present?
  end

  def show
    @therapist = Therapist.find(params[:id])
    @current_patient = Patient.find_by_user_id(current_user.id)
  end

  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = Therapist.new(therapist_params)
    @therapist.user_id = current_user.id

    if @therapist.save
      flash[:success] = "Patient #{@therapist&.name} was register successfully"
      redirect_to therapists_path
    else
      render :new
    end
  end

  def edit
    @therapist = Therapist.find(params[:id])
  end

  def update
    @therapist = Therapist.find(params[:id])
    if @therapist.update(therapist_params)
      flash[:success] = "Patient #{@therapist&.name} was updated successfully"
      redirect_to therapists_path
    else
      render :new
    end
  end

  protected

  def therapist_params
    params.require(:therapist).permit(:user_id, :name, :contact_no, :specialization,
                                      :age, :available_time_to, :available_time_from,
                                      :degree, :experience, :gender, :email, available_days: [])
  end

  def current_patient
    @current_patient = Patient.find_by_user_id(current_user.id)
  end
end
