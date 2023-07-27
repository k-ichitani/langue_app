# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :student_state, only: [:create]

  def guest_sign_in
    student = Student.guest
    sign_in student
    redirect_to schedules_path, notice: "ゲストユーザーとしてログインしました。"
  end

  protected

  def student_state
    # 退会しているかを判断するメソッド
    @student = Student.find_by(email: params[:student][:email])
    return if !@student
    if @student.valid_password?(params[:student][:password]) && (@student.is_deleted == true)
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_student_session_path
    elsif
      flash[:notice] = "項目を入力してください"
    else
      flash[:notice] = "該当するユーザーが見つかりません"
    end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
