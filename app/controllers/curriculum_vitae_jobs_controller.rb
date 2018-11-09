class CurriculumVitaeJobsController < ApplicationController
  before_action :find_job, only: :create

  def create
    @cv_job = @job.curriculum_vitae_jobs.build cv_job_params

    if @cv_job.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to @job
  end

  private

  def find_job
    @job = Job.find_by id: params[:job_id]

    return if @job
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end

  def cv_job_params
    params.require(:curriculum_vitae_job).permit :job_id, :curriculum_vitae_id
  end
end
