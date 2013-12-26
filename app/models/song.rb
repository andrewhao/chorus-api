class Song < ActiveRecord::Base
  has_many :set_lists, :through => :set_list_to_songs
  has_many :set_list_to_songs
end
