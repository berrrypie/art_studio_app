class CoursePolicy < ApplicationPolicy
    attr_reader :user, :course
  
    def initialize(user, ticket)
      @user = user
      @course = course
    end
  
    def create?
      @user.present? && @user.teacher?
    end
  
    def update?
      @user.present? && @user.teacher?
    end
  
    def destroy?
      @user.present? && @user.teacher?
    end
  end