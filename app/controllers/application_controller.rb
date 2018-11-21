class ApplicationController < ActionController::Base
  before_action :set_locale

  def route_not_found
    flash[:warning] = t "not_exist"
    redirect_to root_path
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
