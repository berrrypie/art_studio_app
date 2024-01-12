class TeacherPolicy < ApplicationPolicy
    attr_reader :user, :course
  
    def initialize(user, course)
      @user = user
      @course = course
    end
  
    def index?
      @user.present? && @user.teacher?
    end
  end