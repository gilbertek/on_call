class AddLatitudeAndLongitudeToDoctorAndPatient < ActiveRecord::Migration
  def change
    add_column :doctors, :latitude, :float
    add_column :doctors, :longitude, :float
    add_column :patients, :latitude, :float
    add_column :patients, :longitude, :float
  end
end
