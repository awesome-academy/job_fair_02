class JobsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)
  before_action :support, only: %i(new create index show)
  before_action :find_job, only: %i(show)

  def index
    @ransack = Job.select_job.job_expired.order_job.ransack params[:q]
    @jobs = @ransack.result.page(params[:page]).per Settings.per_sheet
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new job_params

    if @job.save
      flash[:success] = t ".success"
      redirect_to @job
    else
      flash[:danger] = t ".error"
      render :new
    end
  end

  def show
    return unless user_signed_in?
    @cv_job = @job.curriculum_vitae_jobs.build
  end

  private

  def find_job
    @job = Job.find_by id: params[:id]

    return if @job
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end

  def support
    @support = Supports::Job.new @job, current_user
  end

  def job_params
    params.require(:job).permit Job::JOB_ATTRS
  end
end
