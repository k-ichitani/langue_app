class ReservationsController < ApplicationController
  def new
    @schedule = Schedule.find(params[:schedule_id])
    @reservation = Reservation.new
    @day = params[:day]
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
      render 'new'
    end
  end

  def complete
  end

  def index
    # @schedules = Schedule.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 2).order(day: :desc)
    @schedules = Schedule.all
    if @schedules.present? && student_signed_in?
      @student = current_student
      @reservations = @student.reservations
      # @student = @reservations.student_id
    elsif @schedules.present? && admin_signed_in?
      @reservations = @schedules.map(&:reservations).flatten
    elsif @schedules.present? && teacher_signed_in?
      @reservations = @schedules.map(&:reservations).flatten
    else
      flash[:error] = '予約はありません'
      redirect_to schedules_path
    end
  end

  def show
    @reservation = Reservation.find(params[:id])

  end

  def edit
  end

  private
  def reservation_params
    # byebug
    # params.require(:reservation).permit(:student_id, :schedule_id, :start_time, :finish_time, :status)
    params.require(:reservation).permit(:student_id, :start_time, :finish_time, :schedule_id)
  end
end
