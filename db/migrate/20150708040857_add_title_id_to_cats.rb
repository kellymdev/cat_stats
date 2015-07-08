class AddTitleIdToCats < ActiveRecord::Migration
  def change
    change_table :cats do |t|
      t.belongs_to :title
    end
  end
end
