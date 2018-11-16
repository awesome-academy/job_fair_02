class CurriculumVitaeJobsController < ApplicationController
  before_action :find_job, only: :create

  def create
    command = CurriculumVitaeUpload.call current_user, @job, cv_job_params

    if command.success?
      flash[:success] = t ".success"
    else
      flash[:danger] = command.errors[:failed]
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
    params.require(:curriculum_vitae_job).permit :curriculum_vitae_id,
      :cv_upload
  end
end
