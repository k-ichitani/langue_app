class FavoritesController < ApplicationController
  def create
    if student_signed_in?
      @teacher = Teacher.find(params[:id])
      @favorite = Favorite.create(student_id: current_student.id, teacher_id: params[:id])
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    if student_signed_in?
      @teacher = Teacher.find(params[:id])
      Favorite.find_by(student_id: current_student.id, teacher_id: params[:id]).destroy
      redirect_back fallback_location: root_path
    end
  end
end
