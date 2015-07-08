class AddCoatColourIdToCats < ActiveRecord::Migration
  def change
    change_table :cats do |t|
      t.belongs_to :coat_colour
    end
  end
end
