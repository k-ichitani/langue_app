class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
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
      redirect_to teachers_information_path(@teacher.id)
    else
      render 'edit'
    end
  end

  def confirm
  end

  private

  def teacher_params
    params.require(:teacher).permit(:last_name, :first_name, :email, :telephone_number, :specialty, :is_deleted, :introduction, :image)
  end

end
