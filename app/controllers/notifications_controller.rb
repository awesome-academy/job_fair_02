class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: %i(index show)

  def index
    @notifications = current_user.notifications.ordered.page(params[:page])
                                 .per Settings.per_sheet
  end

  def show
    @notification = Notification.find_by id: params[:id]
    @notification.update read: true
    if @notification.target_type == Job.name
      redirect_to job_path(@notification.target_id)
    else
      redirect_to curriculum_vitae_path(@notification.target_id)
    end
  end
end
