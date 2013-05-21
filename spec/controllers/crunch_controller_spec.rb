require 'spec_helper'

describe CrunchController do

  describe "#index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end
  end

  describe "#ddd" do
    before :each do
      get :ddd
    end

    it "responds successfully" do
      expect(response).to be_success
    end

    it "assigns a data array" do
      expect(response).to be_a Hash
    end
  end

  describe "#morris" do
    before :each do
      get :morris
    end

    it "responds successfully" do
      expect(response).to be_success
    end

    it "assigns a data array" do
      expect(response).to be_a Hash
    end
  end

  describe "#statusboard" do
    before :each do
      get :statusboard
      @fb_data = assigns(:fb_data)
      @response = response
    end

    it "responds successfully" do
      expect(@response).to be_success
    end

    it "assigns a data hash" do
      expect(@response).to be_a Hash
    end

    it "data has contains a graph key" do
      expect(@fb_data["graph"]).to be_a Hash
    end

    it "graph has a title" do
      expect(@fb_data["graph"]["title"]).to eq "FB Billion Dollar Club Funding History"
    end

    it "graph has a data hash" do
      expect(@fb_data["graph"]["datasequences"]).to be_a Hash
    end
  end

end