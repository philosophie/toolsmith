require "spec_helper"

describe Toolsmith::Views::PageHeader do
  let(:view_context) { AbstractActionView.new }
  subject { described_class.new(view_context, "New Title") }

  context "#initialize" do
    it "initializes with a title" do
      header = described_class.new(view_context, "New Title")
      expect(header.title).to eq("New Title")
    end

    it "initializes with a subtitle" do
      header = described_class.new(view_context, "New Title", "Subtitle!")
      expect(header.subtitle).to eq("Subtitle!")
    end
  end

  context "#title" do
    it "can be set" do
      subject.title = "New Title"
      expect(subject.title).to eq("New Title")
    end
  end

  context "#subtitle" do
    it "can be set" do
      subject.subtitle = "New subtitle"
      expect(subject.subtitle).to eq("New subtitle")
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
    subject { described_class.new(view_context, "Title", "Subtitle") }
    let(:element) { Nokogiri::HTML(subject.to_s) }

    before do
      subject.button title: "Click me!", icon: "plus-sign", path: "/"
    end

    it "renders a h1 with the title" do
      h1 = element.at_css("h1")
      expect(h1.text).to include "Title"
    end

    it "renders a h1 with a subtitle" do
      subtitle = element.at_css("h1 small")
      expect(subtitle.text).to eq("Subtitle")
    end

    it "renders a content block with a button group" do
      expect(subject.to_s).to have_tag "h1 div.pull-right div.btn-group"
    end

    it "renders a content block with buttons in a button group" do
      expect(subject.to_s).to have_tag "h1 div.pull-right div.btn-group a.btn"
    end

    it "renders an icon in a button" do
      expect(subject.to_s).to have_tag "a.btn i.icon-plus-sign"
    end
  end
end