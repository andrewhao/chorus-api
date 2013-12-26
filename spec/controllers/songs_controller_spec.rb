require 'spec_helper'

describe SongsController do

  # This should return the minimal set of attributes required to create a valid
  # Song. As you add validations to Song, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {
    :title => "The Star Spangled Banner",
    :description => "The iconic performance at Woodstock",
    :key => "G",
    :raw_text => "G A C\nOh say can you see"
  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SongsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all songs as @songs" do
      song = Song.create! valid_attributes
      get :index, {:format => "json"}, valid_session
      assigns(:songs).should eq([song])
    end
  end

  describe "GET show" do
    let(:song) do
      Song.create! valid_attributes
    end

    it "assigns the requested song as @song" do
      get :show, {:id => song.to_param, :format => "json"}, valid_session
      assigns(:song).should eq(song)
    end

    it "returns a song in JSON format" do
      get :show, {:id => song.to_param, :format => 'json'}, valid_session

      json = ActiveSupport::JSON.decode response.body
      json.should be_kind_of Hash
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Song" do
        expect {
          post :create, {:song => valid_attributes, :format => "json"}, valid_session
        }.to change(Song, :count).by(1)
      end

      it "assigns a newly created song as @song" do
        post :create, {:song => valid_attributes, :format => "json"}, valid_session
        assigns(:song).should be_a(Song)
        assigns(:song).should be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved song as @song" do
        # Trigger the behavior that occurs when invalid params are submitted
        Song.any_instance.stub(:save).and_return(false)
        post :create, {:song => { :badparam => "hello" }, :format => "json"}, valid_session
        assigns(:song).should be_a_new(Song)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested song" do
        song = Song.create! valid_attributes

        expect {
          put :update, {:id => song.to_param, :song => { "title" => "params" }, :format => "json"}, valid_session
        }.to change{ song.reload.title }.from(song.title).to("params")
      end

      it "assigns the requested song as @song" do
        song = Song.create! valid_attributes
        put :update, {:id => song.to_param, :song => valid_attributes, :format => "json"}, valid_session
        assigns(:song).should eq(song)
      end
    end

    describe "with invalid params" do
      it "assigns the song as @song" do
        song = Song.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Song.any_instance.stub(:save).and_return(false)
        put :update, {:id => song.to_param, :song => { :badparam => "hello" }, :format => "json"}, valid_session
        assigns(:song).should eq(song)
      end
    end
  end

  describe "DELETE destroy" do
    let(:song) { Song.create! valid_attributes }

    it "destroys the requested song" do
      song
      expect {
        delete :destroy, {:id => song.to_param, :format => "json"}, valid_session
      }.to change(Song, :count).by(-1)
    end

    it "returns 200 OK" do
      delete :destroy, {:id => song.to_param, :format => "json"}, valid_session
      response.should be_ok
    end
  end
end
