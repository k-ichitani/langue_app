class FavoritesController < ApplicationController
  def create
    if student_signed_in?
      @favorite = Favorite.create(student_id: current_student.id, teacher_id: params[:id])
    end
  end

  def destroy
    if student_signed_in?
      Favorite.find_by(student_id: current_student.id, teacher_id: params[:id]).destroy
    end
  end
end
