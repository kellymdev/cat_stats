class AddGenderToCat < ActiveRecord::Migration
  def change
    change_table :cats do |t|
      t.belongs_to :gender
    end
  end
end
