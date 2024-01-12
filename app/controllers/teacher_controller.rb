class TeacherController < ApplicationController
    def index
        @courses = Course.all
        authorize Course, policy_class: TeacherPolicy
      rescue Pundit::NotAuthorizedError
        redirect_to root_path
      end
end
