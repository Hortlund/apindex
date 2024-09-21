class SubmissionsController < ApplicationController
  before_action :set_submissions, only: [:index, :create]

  def index
    @submission = Submission.new
    @submissions = Submission.order(difference: sort_direction).page(params[:page]).per(100)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      respond_to do |format|
        format.js
        format.html { redirect_to submissions_path, notice: 'Ditt Apindex har skapats' }
      end
    else
      respond_to do |format|
        format.js
        format.html { render :index }
      end
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:name, :height, :arm_length, :age, :gender)
  end

  def set_submissions
    @submissions = Submission.order(difference: sort_direction).page(params[:page]).per(100)
  end

  def sort_direction
    params[:sort_order] == 'asc' ? :asc : :desc
  end

end
