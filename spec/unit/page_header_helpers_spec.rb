require "spec_helper"

describe Toolsmith::ViewHelpers::PageHeaderHelpers do
  subject { AbstractActionView.new }
  let(:page_header) { double("page_header", to_s: "content") }

  before do
    Toolsmith::Views::PageHeader.should_receive(:new).with(subject, kind_of(String), anything).and_return(page_header)
  end

  context "#page_header" do
    it "accepts a title" do
      expect {|b| subject.page_header "title", &b }.to yield_with_args(page_header)
    end

    it "accepts a subtitle" do
      expect {|b| subject.page_header "title", "subtitle", &b }.to yield_with_args(page_header)
    end

    context "renders" do
      it "a full width column" do
        expect(subject.page_header("title")).to have_tag "div.row div.span12"
      end

      it "a fluid full width column" do
        expect(subject.page_header("title", {fluid: true})).to have_tag "div.row-fluid"
      end

      it "a header within the full width column" do
        markup = subject.page_header("title").to_s.to_element
        expect(markup.at_css("div.span12").inner_html).to eq(page_header.to_s)
      end
    end
  end
end