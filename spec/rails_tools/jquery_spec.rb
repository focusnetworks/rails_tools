require "spec_helper"

describe RailsTools::Jquery do
  before do
    @url = "http://code.jquery.com/jquery-latest.min.js"
    @destiny = File.dirname(__FILE__) + "/../tmp"
    @file = @destiny + "/jquery.js"
  end

  it "should update file" do
    @mock = mock("open-uri", :read => "JQUERY CONTENT")
    RailsTools::Jquery.should_receive(:open).with(@url).and_return(@mock)
    RailsTools::Jquery.update(:to => @destiny)

    File.read(@file).should == "JQUERY CONTENT"
  end

  it "should overwrite previous file" do
    File.open(@file, "w+") << "OLD JQUERY CONTENT"
    @mock = mock("open-uri", :read => "UPDATED JQUERY CONTENT")
    RailsTools::Jquery.should_receive(:open).with(@url).and_return(@mock)
    RailsTools::Jquery.update(:to => @destiny)

    File.read(@file).should == "UPDATED JQUERY CONTENT"
  end
end
