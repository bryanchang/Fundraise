require 'spec_helper'

describe Crunch do

  describe "#fetch" do
    it "fetches data is in Hash" do
      crunch = Crunch.new
      crunch.should be_a Array
    end
  end

end