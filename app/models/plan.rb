class Plan < ActiveRecord::Base

  has_many :products, dependent: :destroy
  has_many :sections, dependent: :destroy
  has_many :machines, dependent: :destroy
  has_many :devices , dependent: :destroy
  has_many :departments, dependent: :destroy

  scope :full, -> {includes(:products, :sections)}

  validates :name, presence: true
  validates :year, presence: true
  
  def edit?(u)
    u && u.admin?
  end
  
  def self.add?(u)
    u && u.admin?
  end  

end
