class Doctor < ActiveRecord::Base
  include PersonConcern

  belongs_to  :specialty

  def name
    "Dr. #{super}"
  end
end
