class CreateSetListToSongs < ActiveRecord::Migration
  def change
    create_table :set_list_to_songs do |t|
      t.references :set_list, index: true
      t.references :song, index: true

      t.timestamps
    end
  end
end
