require "spec_helper"

describe Toolsmith::ViewHelpers::GridHelpers do
  subject { AbstractActionView.new }
  let(:content_block) do
    Proc.new { "content" }
  end

  context "#row" do
    let(:element) { subject.row(&content_block).to_element }
    it "renders a row with a class" do
      expect(element[:class]).to eq "row"
    end

    it "renders a row with content" do
      expect(element.text).to eq("content")
    end
  end

  context "#column" do
    it "renders a column with correct width" do
      element = to_element subject.column(3, &content_block), "div"
      expect(element[:class]).to eq("span3")
    end

    it "renders a column with an offset" do
      element = to_element subject.column(3, offset: 2, &content_block), "div"
      expect(element[:class]).to include "offset2"
    end

    it "renders a column with content" do
      element = to_element subject.column(3, &content_block), "div"
      expect(element.text).to eq("content")
    end
  end

  context "#full_width_column" do
    it "renders a row with a 12 wide colum" do
      doc = Nokogiri::HTML(subject.full_width_column(&content_block))

      expect(doc.at_css("div.row")).to be_present
      expect(doc.at_css("div.row div.span12")).to be_present
    end
  end
end