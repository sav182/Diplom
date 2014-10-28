class Product < ActiveRecord::Base
  has_many :sections, dependent: :destroy
  belongs_to :plan
  scope :full, -> {includes(:sections)}

  validates :name, presence: true, uniqueness: true, length: {maximum: 255}
  validates :inventory_number, presence: true, uniqueness: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :amount_sections, presence: true, uniqueness: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  def edit?(u)
    u && u.admin?
  end

  def self.add?(u)
    u && u.admin?
  end
end
