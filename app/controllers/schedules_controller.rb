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
    if current_student.present? && params[:teacher_id].present?
      @teacher = Teacher.find(params[:teacher_id])
      @schedules = @teacher.schedules.where("start_time >= ?", Date.current).order(start_time: :asc)
    elsif teacher_signed_in?
      @teacher = current_teacher
      @schedules = @teacher.schedules.order(start_time: :desc)
    else
      @schedules = Schedule.all.order(start_time: :desc)
      # @teacher = @schedules.teacher
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    @teacher = @schedule.teacher
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
