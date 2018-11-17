class CurriculumVitaeUpload
  prepend SimpleCommand

  attr_reader :user, :job

  def initialize user, job, cv_job_params
    @user = user
    @job = job
    @cv_id = cv_job_params[:curriculum_vitae_id]
    @cv_upload = cv_job_params[:cv_upload]
  end

  def call
    if @cv_upload && @cv_id.present?
      errors.add :failed, I18n.t(".cant_select_and_upload")
    elsif @cv_upload
      @cv = user.curriculum_vitaes.create cv_upload: @cv_upload
      return errors.add :failed, I18n.t(".upload_failed") unless
        @cv.save(validate: false)
      @cv_job = job.curriculum_vitae_jobs.create curriculum_vitae_id: @cv.id
    elsif @cv_id.present?
      @cv_job = job.curriculum_vitae_jobs.create curriculum_vitae_id: @cv_id
      return errors.add :failed, I18n.t(".cv_applied") unless @cv_job.save
    else
      errors.add :failed, I18n.t("applied_failed")
    end
  end
end
