class ChangeSongRawTextType < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :songs do |s|
        dir.up { s.change :raw_text, :text }
        dir.down { s.change :raw_text, :string }
      end
    end
  end
end
