require 'spec_helper'

require 'active_record'
require 'active_support'
require 'ostruct'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Base.connection.create_table(:widgets) do |t|
  t.string :name
  t.integer :site_id
end

ActiveRecord::Base.connection.create_table(:sites) do |t|
  t.string :domain
end

class Widget < ActiveRecord::Base
  belongs_to :site

  include Multisite::DefaultScopeOverride
end

class Site < ActiveRecord::Base
end


describe Multisite::DefaultScopeOverride do
  context "basic scope requirements" do
    describe "querying without setting Multisite.current_site" do
      it "should raise" do
        lambda{ Widget.first }.should raise_error
      end
    end

    describe "querying with Multisite.current_site set" do
      it "should not raise" do
        Multisite.current_site = OpenStruct.new({:id => 1})
        lambda{ Widget.first }.should_not raise_error
      end
    end
  end

  context "scoping by site" do
    before(:each) do
      @site1 = Site.create(:domain => 'jd.com')
      @site2 = Site.create(:domain => 'josh.com')

      Multisite.current_site = @site1
      @widget1 = Widget.create :name => 'jd widget'

      Multisite.current_site = @site2
      Widget.create :name => 'josh widget'
    end

    it "should find widgets in current site" do
      Multisite.current_site = @site2

      w = Widget.find_by_name 'jd widget'
      w.should be_nil

      w = Widget.find_by_name 'josh widget'
      w.should_not be_nil
    end
  end
end
