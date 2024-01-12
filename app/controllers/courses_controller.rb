class CoursesController < ApplicationController
    before_action :set_course, only: %i[ add show edit update destroy ]
    before_action :authenticate_user!, only: %i[ new edit create update destroy ]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    authenticate_user! unless user_signed_in?
    @course = Course.new
    begin
      authorize @course
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
      return
    end
  end

  # GET /courses/1/edit
  def edit
    authenticate_user! unless user_signed_in?
    begin
      authorize @course
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
      return
    end
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to :courses }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to :courses }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    authenticate_user! unless user_signed_in?
    begin
      authorize @course
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
      return
    end
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to :courses }
      format.json { head :no_content }
    end
  end

  def add
    authenticate_user! unless user_signed_in?
    user = User.find(current_user.id)
    user.courses << @course if user.courses.where(id: @course.id).first.blank?
    redirect_to :course
  end

  def remove
    authenticate_user! unless user_signed_in?
    user = User.find(current_user.id)
    user.courses.delete(params[:id])
    redirect_to :profile
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      authenticate_user! unless user_signed_in?
      params.require(:course).permit(:name, :description, :duration, :date, :audit, :price)
    end
end
