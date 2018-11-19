module ApplicationHelper
  def full_title page_title = ""
    base_title = t "base_title"

    return base_title if page_title.empty?
    page_title + " | " + base_title
  end

  def show_notifications
    @notifications = current_user.notifications.ordered
                                 .limit(Settings.show_notification)
  end
end
