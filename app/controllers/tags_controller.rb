class TagsController < ApplicationController
  before_action :find_tag, only: %i(show follow unfollow)

  def show
    @curriculum_vitaes = CurriculumVitae.tagged_with(params[:id])
                                        .page(params[:page])
                                        .per Settings.per_sheet
    @jobs = Job.tagged_with(params[:id]).page(params[:page])
               .per Settings.per_sheet
  end

  def follow
    current_user.follow(@tag)
    @follow = Follow.find_by follower: current_user, followable: @tag
    respond_to do |format|
      format.html{redirect_to tag_path(@tag.name)}
      format.js
    end
  end

  def unfollow
    current_user.stop_following(@tag)
    respond_to do |format|
      format.html{redirect_to tag_path(@tag.name)}
      format.js
    end
  end

  private

  def find_tag
    @tag = Tag.find_by name: params[:id]

    return if @tag
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end
end
