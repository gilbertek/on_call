class Specialty < ActiveRecord::Base
  enum names: { Orthopedists: 1, Opthamologists: 2, Cardiologists: 3 }.freeze

  validates :name, presence: true
  validates :description, presence: true
  has_many :doctors
end
