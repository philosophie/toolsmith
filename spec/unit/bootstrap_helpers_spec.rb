require "spec_helper"

describe Toolsmith::ViewHelpers::BootstrapHelpers do
  subject { AbstractActionView.new }
  let(:content_block) do
    Proc.new { "content" }
  end

  context "#row" do
    let(:element) { to_element subject.row(&content_block), "div" }
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

  context "#form_actions" do
    let(:element) { to_element subject.form_actions(&content_block), "div" }
    
    it "renders a container with a class" do
      expect(element[:class]).to include "form-actions"
    end

    it "renders a container with content" do
      expect(element.text).to eq("content")
    end
  end

  context "#flash_div" do
    it "renders a close link in the div" do
      subject.flash.now[:success] = "Success!"
      element = to_element(subject.flash_div(:success), "div").at_css("a.close")
      expect(element).to be_present
    end

    described_class::FLASH_LEVELS.each do |level|
      it "renders a flash div for #{level}" do
        subject.flash.now[level] = "#{level}!"
        element = to_element(subject.flash_div(level), "div")
        element.at_css("a").remove
        expect(element.text).to eq("#{level}!")
      end
    end
  end
end