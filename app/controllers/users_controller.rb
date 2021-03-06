class UsersController < ApplicationController
  before_action :find_user, only: :show

  def show; end

  private

  def find_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end
end
