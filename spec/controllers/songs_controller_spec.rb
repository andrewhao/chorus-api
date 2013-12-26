require 'spec_helper'

describe SongsController do

  # This should return the minimal set of attributes required to create a valid
  # Song. As you add validations to Song, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SongsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all songs as @songs" do
      song = Song.create! valid_attributes
      get :index, {}, valid_session
      assigns(:songs).should eq([song])
    end
  end

  describe "GET show" do
    it "assigns the requested song as @song" do
      song = Song.create! valid_attributes
      get :show, {:id => song.to_param}, valid_session
      assigns(:song).should eq(song)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Song" do
        expect {
          post :create, {:song => valid_attributes}, valid_session
        }.to change(Song, :count).by(1)
      end

      it "assigns a newly created song as @song" do
        post :create, {:song => valid_attributes}, valid_session
        assigns(:song).should be_a(Song)
        assigns(:song).should be_persisted
      end

      it "redirects to the created song" do
        post :create, {:song => valid_attributes}, valid_session
        response.should redirect_to(Song.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved song as @song" do
        # Trigger the behavior that occurs when invalid params are submitted
        Song.any_instance.stub(:save).and_return(false)
        post :create, {:song => {  }}, valid_session
        assigns(:song).should be_a_new(Song)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested song" do
        song = Song.create! valid_attributes
        # Assuming there are no other songs in the database, this
        # specifies that the Song created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Song.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => song.to_param, :song => { "these" => "params" }}, valid_session
      end

      it "assigns the requested song as @song" do
        song = Song.create! valid_attributes
        put :update, {:id => song.to_param, :song => valid_attributes}, valid_session
        assigns(:song).should eq(song)
      end
    end

    describe "with invalid params" do
      it "assigns the song as @song" do
        song = Song.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Song.any_instance.stub(:save).and_return(false)
        put :update, {:id => song.to_param, :song => {  }}, valid_session
        assigns(:song).should eq(song)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested song" do
      song = Song.create! valid_attributes
      expect {
        delete :destroy, {:id => song.to_param}, valid_session
      }.to change(Song, :count).by(-1)
    end
  end
end
