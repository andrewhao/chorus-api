class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :description
      t.string :key
      t.string :raw_text

      t.timestamps
    end
  end
end
