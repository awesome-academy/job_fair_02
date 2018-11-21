module JobsHelper
  def new_job? job
    date = Date.current - job.created_at.to_date
    return true if date < Settings.new_job
  end

  def user_organization? user, organization_id
    user.organization_users.exists? organization_id: organization_id
  end
end
