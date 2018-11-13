class StaticPagesController < ApplicationController
  def home
    @jobs = Job.select_job.job_expired.order_job.page(params[:page])
               .per Settings.per_sheet
  end
end
