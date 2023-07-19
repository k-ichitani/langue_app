class StudentsController < ApplicationController
  # before_action :authenticate_admin!
  # before_action :authenticate_teacher!, only: [:show]
  # before_action :authenticate_student!, only: [:show, :edit, :update, :confirm, :withdraw]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to students_information_path(@student.id)
  end

  def confirm
    @student = Student.find_by(email: params[:email])
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
        redirect_to students_mypage_path(@student)
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
end