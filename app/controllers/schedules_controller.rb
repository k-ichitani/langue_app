class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    @schedule.teacher_id = params[:schedule][:teacher_id]
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.teacher_id = params[:schedule][:teacher_id]
    if @schedule.save
      redirect_to admin_schedules_path, notice: "シフトを登録しました。"
    else
      puts @schedule.errors.full_messages
      render 'new'
    end
  end

  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :finish_time, :teacher_id)
  end
end
