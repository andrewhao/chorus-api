require "spec_helper"

describe Song do
  let(:song) { Song.create }
  let(:set_list) { SetList.create }

  context "associations" do
    it "has many set_lists" do
      song.set_lists << set_list
      song.save

      song.set_lists.should == [set_list]
    end

    it "can build set_lists" do
      expect {
        song.set_lists << SetList.create
        song.save
      }.to change{ song.set_lists.count }.by(1)
    end
  end
end
