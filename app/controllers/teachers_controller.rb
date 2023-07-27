class TeachersController < ApplicationController
  before_action :authenticate_login_user

  def index
    if student_signed_in?
      @teachers = Teacher.where(is_deleted: false).page(params[:page])
    else
      @teachers = Teacher.page(params[:page])
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
    @schedules = @teacher.schedules
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to teachers_information_path(@teacher.id), notice: "講師情報を更新しました。"
    else
      flash[:alert] = "更新に失敗しました。"
      render 'edit'
    end
  end

  def confirm
  end

  private

  def authenticate_login_user
    case action_name
    when "index"
      redirect_to new_student_session_path unless student_signed_in? || admin_signed_in?
    when "show"
      redirect_to new_student_session_path unless student_signed_in? || teacher_signed_in? || admin_signed_in?
    when "edit"
      redirect_to new_teacher_session_path unless teacher_signed_in? || admin_signed_in?
    when "update"
      redirect_to new_teacher_session_path unless teacher_signed_in? || admin_signed_in?
    end
    # # indexの場合
    # if action_name == "index"
    #   unless student_signed_in? || admin_signed_in?
    #     redirect_to new_student_session_path
    #   end
    # end
    # # showの場合
    # if action_name == "show"
    #   unless student_signed_in? || teacher_signed_in? || admin_signed_in?
    #     redirect_to new_student_session_path
    #   end
    # end
    # # editの場合
    # if action_name == "edit"
    #   unless teacher_signed_in? || admin_signed_in?
    #     redirect_to new_teacher_session_path
    #   end
    # end
    # # updateの場合
    # if action_name == "update"
    #   unless teacher_signed_in? || admin_signed_in?
    #     redirect_to new_teacher_session_path
    #   end
    # end
  end

  def teacher_params
    params.require(:teacher).permit(:last_name, :first_name, :email, :telephone_number, :specialty, :is_deleted, :introduction, :image)
  end

end
