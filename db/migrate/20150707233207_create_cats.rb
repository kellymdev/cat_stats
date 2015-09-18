class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :pet_name
      t.string :registered_name
      t.string :registration_number
      t.date :date_of_birth
      t.date :date_of_death
      t.timestamps null: false
    end
  end
end
