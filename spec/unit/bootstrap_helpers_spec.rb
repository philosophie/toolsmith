require "spec_helper"

describe Toolsmith::ViewHelpers::BootstrapHelpers do
  subject { AbstractActionView.new }
  let(:content_block) do
    Proc.new { "content" }
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
    after do
      subject.flash.clear
    end

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

  context "#flash_divs" do
    after do
      subject.flash.clear
    end

    it "renders all flash divs" do
      described_class::FLASH_LEVELS.each do |level|
        subject.flash.now[level] = "Flash #{level}!"
      end

      divs = Nokogiri::HTML(subject.flash_divs).css("div.alert")
      expect(divs.size).to eq(3)
    end
  end
end