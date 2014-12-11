class Department < ActiveRecord::Base
  has_many :machines, dependent: :destroy
  has_many :devices , dependent: :destroy
  belongs_to :plan


  validates :name, presence: true, uniqueness: true, length: {maximum: 255}

  scope :full, -> {includes(:machines, :devices)}

  def edit?(u)
    u && u.admin?
  end

  def self.add?(u)
    u && u.admin?
  end
end
