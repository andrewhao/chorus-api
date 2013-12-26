class CreateSetLists < ActiveRecord::Migration
  def change
    create_table :set_lists do |t|
      t.string :title

      t.timestamps
    end
  end
end
