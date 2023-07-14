class ReservationsController < ApplicationController
  def new
    @schedule = Schedule.find(params[:schedule_id])
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
  end

  def create
  end

  def complete
  end

  def index
    @schedules = Schedule.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    if @schedules.present?
      @reservations = @schedules.map(&:reservations).flatten
    else
      flash[:error] = '予約はありません'
      redirect_to schedules_path
    end
  end

  def show
  end

  def edit
  end

  private
  def reservation_params
    params.require(:reservation).permit(:student_id, :schedule_id, :start_time, :finish_time, :status)
  end
end
