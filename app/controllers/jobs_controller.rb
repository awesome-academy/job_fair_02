class JobsController < ApplicationController
  before_action :authenticate_user!, :support, only: %i(new create)

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

  private

  def support
    @support = Supports::Job.new @job, current_user
  end

  def job_params
    params.require(:job).permit Job::JOB_ATTRS
  end
end
