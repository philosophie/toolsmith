require "spec_helper"

describe Toolsmith::Views::DefinitionList do
  let(:view_context) { AbstractActionView.new }
  subject { described_class.new(view_context) }

  context "#define" do
    it "adds a definition" do
      expect { subject.define "Term", "Definition" }.to change(subject.definitions, :size).from(0).to(1)
    end
  end

  context "#to_s" do
    let(:element) { subject.to_s.to_element }

    before do
      subject.define "Term", "Description"
    end

    it "renders a definition list tag with a class" do
      expect(element.node_name).to eq("dl")
      expect(element[:class]).to eq("dl-horizontal")
    end

    it "renders a definition term within the list tag" do
      expect(subject.to_s).to have_tag "dl dt"
    end

    it "renders a definition description within the list tag" do
      expect(subject.to_s).to have_tag "dl dd"
    end
  end
end