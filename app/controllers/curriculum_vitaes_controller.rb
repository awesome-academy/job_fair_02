class CurriculumVitaesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)
  before_action :find_cv, :cv_public, only: %i(show)

  def new
    @curriculum_vitae = current_user.curriculum_vitaes.new
    @curriculum_vitae.curriculum_vitae_details.build
  end

  def create
    @curriculum_vitae = current_user.curriculum_vitaes.build cv_params

    if @curriculum_vitae.save
      flash[:success] = t ".success"
      redirect_to @curriculum_vitae
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end

  def show; end

  private

  def cv_public
    @details = @cv.curriculum_vitae_details

    return if @cv.public? || user_signed_in? && @cv.user_id == current_user.id
    flash[:danger] = t ".not_permit"
    redirect_to root_path
  end

  def find_cv
    @cv = CurriculumVitae.find_by id: params[:id]

    return if @cv
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end

  def cv_params
    params.require(:curriculum_vitae).permit CurriculumVitae::CURRICULUM_VITAE_PARAMS
  end
end
