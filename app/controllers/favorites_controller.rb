class FavoritesController < ApplicationController
  def create
    if student_signed_in?
      @favorite = Favorite.create(student_id: current_student.id, teacher_id: params[:id])
      redirect_to teachers_information_path
    end
  end

  def destroy
    if student_signed_in?
      Favorite.find_by(student_id: current_student.id, teacher_id: params[:id]).destroy
      redirect_to teachers_information_path
    end
  end
end
