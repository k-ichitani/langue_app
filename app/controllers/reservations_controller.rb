class ReservationsController < ApplicationController
  before_action :authenticate_login_user

  def new
    @schedule = Schedule.find(params[:schedule_id])
    @reservation = Reservation.new
    # @day = params[:day]
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @schedule = Schedule.find(params[:schedule_id])
    @student = current_student
    if @reservation.invalid?
      render :new
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @student = current_student
    if @reservation.save
      redirect_to complete_schedule_reservation_path(@reservation.schedule_id)
    else
      flash[:alert] = "予約に失敗しました。"
      render 'new'
    end
  end

  def complete
  end

  def index
    @schedules = Schedule.all
    if @schedules.present? && student_signed_in?
      @student = current_student
      @reservations = @student.reservations
    elsif @schedules.present? && admin_signed_in?
      @reservations = @schedules.map { |schedule| schedule.reservation }.compact
    elsif @schedules.present? && teacher_signed_in?
      @teacher = current_teacher
      # @reservations = @teacher.schedules.map { |schedule| schedule.reservation }.compact
      @reservations = Reservation.where(schedule_id: @teacher.schedules.pluck(:id)).order(:date)
    else
      flash[:alert] = '予約はありません'
      redirect_to schedules_path
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @student = @reservation.student

  end

  def edit
    @reservation = Reservation.find(params[:schedule_id])
    @student = @reservation.student
    @schedule = @reservation.schedule
  end

  def update
    @reservation = Reservation.find(params[:schedule_id])
    if @reservation.update(reservation_params)
      redirect_to schedule_reservation_path(@schedule)
    else
      render :edit
    end
  end

  private
  def reservation_params
    # byebug
    params.require(:reservation).permit(:student_id, :schedule_id, :status)
  end

  def authenticate_login_user
    case action_name
    when "new"
      redirect_to new_student_session_path unless student_signed_in?
    when "confirm"
      redirect_to new_student_session_path unless student_signed_in?
    when "create"
      redirect_to new_student_session_path unless student_signed_in?
    when "complete"
      redirect_to new_student_session_path unless student_signed_in?
    when "index"
      redirect_to new_student_session_path unless student_signed_in? || teacher_signed_in? || admin_signed_in?
    when "show"
      redirect_to new_student_session_path unless student_signed_in? || teacher_signed_in? || admin_signed_in?
    when "edit"
      redirect_to new_teacher_session_path unless teacher_signed_in? || admin_signed_in?
    when "update"
      redirect_to new_teacher_session_path unless teacher_signed_in? || admin_signed_in?
    end
  end

end
