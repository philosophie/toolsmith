require "spec_helper"

describe Toolsmith::ViewHelpers::PageHeaderHelpers do
  subject { AbstractActionView.new }
  let(:page_header) { double("page_header", to_s: "asd") }

  context "#page_header" do
    before do
      Toolsmith::Views::PageHeader.should_receive(:new_with_title).with(subject, kind_of(String)).and_return(page_header)
    end

    it "accepts a title" do
      expect {|b| subject.page_header_with_buttons "title", &b }.to yield_with_args(page_header)
    end

    it "returns the view object" do
      expect(subject.page_header_with_buttons("title", &Proc.new {} )).to be page_header
    end
  end
end