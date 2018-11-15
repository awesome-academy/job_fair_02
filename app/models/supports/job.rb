class Supports::Job
  attr_reader :job, :user

  def initialize job, user
    @job = job
    @user = user
  end

  def career_options
    @career_options ||= Career.all.map{|p| [p.name, p.id]}
  end

  def province_options
    @province_options ||= Province.all.map{|p| [p.name, p.id]}
  end

  def organization_options
    @organization_options ||= @user.organizations.map{|p| [p.name, p.id]}
  end

  def cv_options
    @cv_options ||= @user.curriculum_vitaes.select(&:public?)
                         .map{|p| [p.industry, p.id]}
  end
end
