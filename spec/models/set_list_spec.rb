require "spec_helper"

describe SetList do
  let(:set_list) { SetList.create }
  let(:song) { Song.create }

  context "associations" do
    it 'has many songs' do
      set_list.songs << song
      set_list.save

      set_list.songs.should == [song]
    end
  end
end
