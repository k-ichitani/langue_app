class StudentsController < ApplicationController
  before_action :ensure_guest_student, only: [:edit]
  before_action :authenticate_login_user

  def index
    @students = Student.page(params[:page])
  end

  def show
    @student = Student.find(params[:id])
    favorites = Favorite.where(student_id: current_student.id).pluck(:teacher_id)
    @favorite_list = Teacher.find(favorites)
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
    redirect_to students_information_path(@student.id), notice: "会員情報を更新しました。"
    else
      flash[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def confirm
    @student = current_student
  end

  def withdraw
    @student = current_student
    if @student
      if @student.update(is_deleted: true)
        reset_session
        flash[:notice] = "退会処理を実行いたしました"
        redirect_to root_path
      else
        flash[:alert] = "退会処理に失敗しました"
        redirect_to students_information_path(@student)
      end
    else
      flash[:alert] = "ユーザーが見つかりません"
      redirect_to root_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:last_name, :first_name, :email, :telephone_number, :is_deleted)
  end

  def ensure_guest_student
    @student = Student.find(params[:id])
    if @student.email == "guest@example.com"
      redirect_to students_information_path(current_student), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end

  def authenticate_login_user
    case action_name
    when "index"
      redirect_to new_student_session_path unless admin_signed_in?
    when "show"
      redirect_to new_student_session_path unless student_signed_in? || teacher_signed_in? || admin_signed_in?
    when "edit"
      redirect_to new_student_session_path unless student_signed_in? || admin_signed_in?
    when "update"
      redirect_to new_student_session_path unless student_signed_in? || admin_signed_in?
    when "confirm"
      redirect_to new_student_session_path unless student_signed_in?
    when "withdraw"
      redirect_to new_student_session_path unless student_signed_in?
    end
  end

end