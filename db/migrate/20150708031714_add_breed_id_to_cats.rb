class AddBreedIdToCats < ActiveRecord::Migration
  def change
    change_table :cats do |t|
      t.belongs_to :breed
    end
  end
end
