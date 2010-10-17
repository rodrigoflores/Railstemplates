require 'spec_helper'

describe "routing downloads" do
  before do
    Factory(:template, :id => 12345)
  end
  it "routes back to the templates controller" do
    {:get => "/12345" }.should route_to(:controller => "templates", :action => "download", :id => "12345")
  end
  
  xit "checks if the template exists" do
    {:get => "/not_a_template"}.should_not be_routable
  end
end
