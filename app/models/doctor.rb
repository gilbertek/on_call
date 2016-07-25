class Doctor < ActiveRecord::Base
  include PersonConcern

  belongs_to  :specialty
  has_many :appointments, inverse_of: :doctor
  has_many :patients, through: :appointments

  geocoded_by :address

  def name
    "Dr. #{super}"
  end

  def name_and_specialty
    "#{name} (#{specialty.name})"
  end

  def address
    [street, city, state, zip, country].compact.join(', ')
  end
end
