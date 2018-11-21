class Job < ApplicationRecord
  acts_as_taggable
  belongs_to :organization
  belongs_to :province
  belongs_to :career
  has_many :curriculum_vitae_jobs
  has_many :curriculum_vitaes, through: :curriculum_vitae_jobs,
    dependent: :destroy

  validates :title, presence: true, length: {maximum: Settings.max_length_title}
  validates :age_from, :age_to, presence: true, numericality: true,
    inclusion: {in: Settings.age_from..Settings.age_to}
  validates :skill, presence: true, length: {maximum: Settings.max_length_level}
  validates :salary, presence: true, numericality: true
  validates :work_address, presence: true,
    length: {maximum: Settings.max_length_address}
  validates :employment_type, presence: true,
    length: {maximum: Settings.max_length_level}
  validates :description, presence: true,
    length: {maximum: Settings.max_length_description}
  validates :experience, presence: true,
    length: {maximum: Settings.max_length_experience}
  validates_numericality_of :age_to, greater_than: :age_from
  validate :check_expried

  JOB_ATTRS = [:organization_id, :career_id, :province_id,
    :title, :age_from, :age_to, :salary, :work_address, :employment_type,
    :skill, :level, :experience, :description, :expiration_date,
    :tag_list].freeze

  scope :select_job, (lambda do
    select :id, :title, :salary, :experience, :expiration_date,
      :organization_id, :province_id, :created_at
  end)
  scope :order_job, ->{order created_at: :desc}
  scope :job_expired,
    ->{where(Job.arel_table[:expiration_date].gteq(Date.current))}

  after_create_commit :create_notification

  def check_expire? job
    job.expiration_date >= Date.current
  end

  private

  def create_notification
    self.tags.each do |tag_job|
      @tag = Tag.find_by id: tag_job.id
      @tag.followers.pluck(:id).each do |id|
        Notification.create user_id: id, target_type: Job.name,
          target_id: @tag.id, content: I18n.t(".noti_job") << @tag.name
      end
    end
  end

  def check_expried
    return unless expiration_date.presence
    return if expiration_date > Date.current
    errors.add :expiration_date, I18n.t(".expiration_date")
  end
end
