class Patient < ActiveRecord::Base
  include PersonConcern

  has_and_belongs_to_many :ailments
  accepts_nested_attributes_for :ailments, allow_destroy: true, reject_if: :all_blank
end
