require 'rails_helper'

RSpec.describe Page, type: :model do

  before { @page = Page.new(url: "http://google.com/") }

  subject { @page }

  it { should respond_to(:url) }
  it { should respond_to(:contents) }

  it { should be_valid }

  it { should have_many(:contents).dependent(:destroy) }

  describe "without url" do
    before { @page.url = "" }
    it { should_not be_valid }
  end

  describe "with invalid url" do
    before { @page.url = "some text" }
    it { should_not be_valid }
  end

end
