class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    # @teacher = current_teacher
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path, notice: "スケジュールを登録しました。"
    else
      puts @schedule.errors.full_messages
      render 'new'
    end
  end

  def index
    @schedules = Schedule.all
    @teacher = current_teacher
    @teacher_schedules = @teacher.schedules
    # if teacher_signed_in?
    #   @teacher = current_teacher
    #   @teacher_schedules = @teacher.schedules
    # else
    #   @schedules = Schedule.all
    # end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path, notice: "スケジュールを変更しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      redirect_to schedules_path
    else
      render 'show'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :finish_time, :teacher_id)
  end
end
