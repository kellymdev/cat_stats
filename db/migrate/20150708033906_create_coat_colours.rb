class CreateCoatColours < ActiveRecord::Migration
  def change
    create_table :coat_colours do |t|
      t.string :colour

      t.timestamps null: false
    end
  end
end
