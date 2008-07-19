require File.join(File.dirname(__FILE__), *%w[spec_helper])
require File.join(File.dirname(__FILE__), *%w[../lib/xfn_stone.rb])

describe XfnStone::Person do
  it "should know its load URL" do
    @person.uri.to_s.should == @url
  end

  it "should return the 'me' links found in the document" do
    @person.mine.size.should == 1
  end

  it "should return the friend links found in the document" do
    @person.friends.size.should == 2
  end

  it "should return the contact links found in the document" do
    @person.friends.size.should == 2
  end

  before(:each) do
    html_page = open(File.join(File.dirname(__FILE__),"bob.html"))
    XfnStone::Document.should_receive(:open).and_return(html_page)
    @url = "http://localhost"
    @person = XfnStone::Person.new(@url)
  end
end

