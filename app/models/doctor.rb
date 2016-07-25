class Doctor < ActiveRecord::Base
  include PersonConcern

  belongs_to  :specialty
  geocoded_by :address

  def name
    "Dr. #{super}"
  end

  def address
    [street, city, state, country].compact.join(', ')
  end
end
