class Asperity < ActiveRecord::Base
  has_many :sections, dependent: :destroy
  has_many :devices, dependent: :destroy
  has_many :machines, dependent: :destroy

  self.inheritance_column = :_type_disabled

  validates :number, presence: true, uniqueness: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :drawing, presence: true
  validates :form_poverh, presence: true
  validates :type_poverh, presence: true
  validates :complexity, presence: true

  scope :full, -> {includes(:sections, :devices)}

  def edit?(u)
    u && u.admin?
  end

  def self.add?(u)
    u && u.admin?
  end
end
