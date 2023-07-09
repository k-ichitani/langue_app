class Public::StudentsController < ApplicationController
  def show
    @student = current_student
  end

  def edit
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
end
