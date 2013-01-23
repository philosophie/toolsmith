require "spec_helper"

describe Toolsmith::Views::PageHeader do
  let(:view_context) { AbstractActionView.new }
  subject { described_class.new(view_context) }

  context ".new_with_title" do
    it "initializes with a title" do
      header = described_class.new_with_title(view_context, "New Title")
      expect(header.title).to eq("New Title")
    end
  end

  context "#title" do
    it "can be set" do
      subject.title = "New Title"
      expect(subject.title).to eq("New Title")
    end
  end

  context "#button" do
    let(:options) { {title: "Click me!", icon: "plus-sign", path: "/"} }

    it "requires a title" do
      options[:title] = nil
      expect { subject.button options }.to raise_error Toolsmith::MissingParameter
    end

    it "requires a icon" do
      options[:icon] = nil
      expect { subject.button options }.to raise_error Toolsmith::MissingParameter
    end

    it "requires a path" do
      options[:path] = nil
      expect { subject.button options }.to raise_error Toolsmith::MissingParameter
    end

    it "adds to the header's buttons" do
      expect { subject.button options }.to change(subject.buttons, :size).from(0).to(1)
    end
  end

  context "#to_s" do
    subject { described_class.new_with_title(view_context, "Title") }
    let(:element) { Nokogiri::HTML(subject.to_s) }

    before do
      subject.button title: "Click me!", icon: "plus-sign", path: "/"
    end

    it "renders a content block with a button group" do
      button_group = element.at_css("div.btn-group")
      expect(button_group.at_css("a.btn")).to be_present
    end

    it "renders a button group with buttons" do
      button_group = element.at_css("div.btn-group")
      button = element.at_css("a.btn")

      expect(button[:class]).to eq("btn")
      expect(button[:title]).to eq("Click me!")
    end

    it "renders buttons with icons" do
      button_group = element.at_css("div.btn-group")
      button = element.at_css("a.btn")
      expect(button.at_css("i.icon-plus-sign")).to be_present
    end
  end
end