require 'spec_helper'

describe Crunchbase do

  describe "#fetch" do
    pending
    it "fetches crunchbase data" do
      cb = Crunchbase.newbundle
      facebook = cb.fetch('facebook')
      expect(facebook).to be_an Array
    end
  end
end