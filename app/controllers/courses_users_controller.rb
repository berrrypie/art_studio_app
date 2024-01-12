class CoursesUsersController < ApplicationController
    before_action :authenticate_user!

  def buy
    course = Course.find params[:id]
    unless current_user.courses.where(id: params[:id]).any?
      current_user.courses << course
    end
    redirect_to course
  end

  def cancel
    course = Course.find params[:id]
    if current_user.courses.where(id: params[:id]).any?
      current_user.courses.delete course.id
    end
    redirect_to course
  end
end
