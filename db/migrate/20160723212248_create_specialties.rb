class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
