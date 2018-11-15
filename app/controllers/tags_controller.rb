class TagsController < ApplicationController
  def show
    @curriculum_vitaes = CurriculumVitae.tagged_with(params[:id])
                                        .page(params[:page])
                                        .per Settings.per_sheet
    @jobs = Job.tagged_with(params[:id]).page(params[:page])
               .per Settings.per_sheet
  end
end
