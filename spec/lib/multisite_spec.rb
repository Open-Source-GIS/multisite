require 'spec_helper'

describe Multisite do
  it "should have a VERSION" do
    lambda{ Multisite::VERSION }.should_not raise_error
  end
end
