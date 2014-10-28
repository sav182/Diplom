class Section < ActiveRecord::Base
  belongs_to :product
  belongs_to :asperity
  belongs_to :machine
  belongs_to :plan

  validates :name, presence: true, uniqueness: true, length: {maximum: 255}
  validates :inventory_number, presence: true, uniqueness: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :drawing, presence: true

  scope :full, -> {includes(:product, :asperity)}

  def edit?(u)
    u && u.admin?
  end

  def self.add?(u)
    u && u.admin?
  end
end
