class Doctor < ActiveRecord::Base
  include PersonConcern

  has_one  :speciality, inverse_of: :doctor

  def name
    "Dr. #{super}"
  end
end
