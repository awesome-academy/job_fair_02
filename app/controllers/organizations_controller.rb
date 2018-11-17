class OrganizationsController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)
  before_action :find_organization, only: %i(show)
  around_action :save_organization, only: :create

  def new
    @organization = current_user.organizations.new
  end

  def create
    @organization = Organization.new organization_params
    @organization.save!
    current_user.organization_users.create! organization: @organization, admin: true
    flash[:success] = t ".success"
    redirect_to @organization
  end

  def show
    @jobs = @organization.jobs.page(params[:page]).per Settings.per_sheet
  end

  private

  def save_organization
    ActiveRecord::Base.transaction do
      yield
    rescue ActiveRecord::RecordInvalid
      flash[:danger] = t ".error"
      render :new
    end
  end

  def find_organization
    @organization = Organization.find_by id: params[:id]

    return if @organization
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end

  def organization_params
    params.require(:organization).permit Organization::ORGANIZATION_ATTRS
  end
end
