class AddSpecialityIdToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :speciality_id, :intger, index: true
  end
end
