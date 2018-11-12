class CurriculumVitaesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create)

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

  private

  def cv_params
    params.require(:curriculum_vitae).permit CurriculumVitae::CURRICULUM_VITAE_PARAMS
  end
end
