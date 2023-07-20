class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    # 0:00 => 0
    # 0:30 => 1
    # 1:00 => 2
    # 1:30 => 3
    # 2:00 => 4
    # 2:30 => 5
    # 年月日を取得
#   start_date = Date.new(params[:schedule]["start_time(1i)"], params[:schedule]["start_time(2i)"], params[:schedule]["start_time(3i)"])
#   start_koma = params[:schedule]["start_time(4i)"] * 2
#   if params[:schedule]["start_time(5i)"] == 30
#     start_koma += 1
#   end
#
#   end_date = Date.new(params[:schedule]["finish_time(1i)"], params[:schedule]["finish_time(2i)"], params[:schedule]["finish_time(3i)"])
#   end_koma = params[:schedule]["finish_time(4i)"] * 2
#   if params[:schedule]["finish_time(5i)"] == 30
#     end_koma += 1
#   end
#   for koma in start_koma...end_koma do
#     Schedule.create(teacher_id: params[:schedule][:teacher_id], koma: koma)
#   end

    if @schedule.save
      redirect_to schedules_path, notice: "スケジュールを登録しました。"
    else
      puts @schedule.errors.full_messages
      render 'new'
    end
  end

  def index
    # scheduleをとってきてスケジュールのコマとreservationのコマを一致させて一致すれば×、reservationになければ〇
    if current_student.present? && params[:teacher_id].present?
      @teacher = Teacher.find(params[:teacher_id])
      @schedules = @teacher.schedules.where("start_time >= ?", Date.current).order(start_time: :asc)
      @reservations = @schedules.reservation
    elsif teacher_signed_in?
      @teacher = current_teacher
      @schedules = @teacher.schedules.order(start_time: :desc)
    else
      @schedules = Schedule.all.order(start_time: :desc)
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
