class ReservationsController < ApplicationController
  def new
  end

  def complete
  end

  def index
    @schedule = Schedule.find(params[:id])

    if @schedule.present?
      @reservations = @schedule.reservations
    else
      flash[error] = '指定されたスケジュールは存在しません'
      redirect_to schedules_path
    end
  end

  def show
  end

  def edit
  end
end
