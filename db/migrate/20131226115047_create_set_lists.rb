class CreateSetLists < ActiveRecord::Migration
  def change
    create_table :set_lists do |t|
      t.string :title, :null => false

      t.timestamps
    end
  end
end
