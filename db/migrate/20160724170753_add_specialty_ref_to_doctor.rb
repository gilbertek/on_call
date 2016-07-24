class AddSpecialtyRefToDoctor < ActiveRecord::Migration
  def change
    add_reference :doctors, :specialty, index: true, foreign_key: true
  end
end
