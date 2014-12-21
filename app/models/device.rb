class Device < ActiveRecord::Base
  belongs_to :asperity
  belongs_to :department
  has_many :sections, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 255}
  validates :model, presence: true
  validates :type_device, presence: true
  validates :type_poverh, presence: true
  validates :form_poverh, presence: true
  validates :cleanliness, presence: true
  validates :complexity, presence: true

  scope :full, -> {includes(:asperity, :department)}

  def edit?(u)
    u && u.admin?
  end

  def self.add?(u)
    u && u.admin?
  end
end
