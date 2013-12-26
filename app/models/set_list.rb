class SetList < ActiveRecord::Base
  has_many :songs, :through => :set_list_to_songs
  has_many :set_list_to_songs
end
