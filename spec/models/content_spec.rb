require 'rails_helper'

RSpec.describe Content, type: :model do

  let(:page) { FactoryGirl.create(:page) }
  before { @content = Content.new(kind: "h1", value: "Test header", page_id: page.id) }

  subject { @content }

  it { should respond_to(:kind) }
  it { should respond_to(:value) }
  it { should respond_to(:page_id) }
  it { should respond_to(:page) }

  it { should be_valid }

  it { should belong_to(:page) }

  its(:page) { should eq page }

  describe "without kind" do
    before { @content.kind = "" }

    it { should_not be_valid }
  end

end
