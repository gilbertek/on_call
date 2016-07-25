class Doctor < ActiveRecord::Base
  include PersonConcern

  belongs_to  :specialty
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
