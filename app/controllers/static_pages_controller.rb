class StaticPagesController < ApplicationController
  def home
    @support = Supports::Job.new @job, current_user
    @ransack = Job.select_job.job_expired.order_job.ransack params[:q]
    @jobs = @ransack.result.page(params[:page]).per Settings.per_sheet
  end
end
