class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def complete
  end

  def index
    @schedules = Schedule.all
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
end
