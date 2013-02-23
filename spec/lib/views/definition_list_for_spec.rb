require "spec_helper"

describe Toolsmith::Views::DefinitionListFor do
  let(:view_context) { AbstractActionView.new }
  let(:content_block) do
    Proc.new {|dl| dl.define :term }
  end

  let(:object) { double("object", term: "definition") }

  context ".new_with_object" do
    it "accepts a view and object" do
      expect do
        described_class.new_with_object(view_context, object, &content_block)
      end.not_to raise_error
    end
  end

  context ".define" do
    let(:klass) { double("klass", respond_to?: true, human_attribute_name: "Woo") }
    subject { described_class.new_with_object(view_context, object, &content_block) }

    it "returns for the human part of the attribute" do
      expect(subject.define(:term)).to eq("<dt>Term</dt><dd>definition</dd>")
    end

    it "returns the human attribute name for the attribute" do
      object.stub(class: klass)
      expect(subject.define(:term)).to eq("<dt>Woo</dt><dd>definition</dd>")
    end
  end

  context ".to_s" do
    subject { described_class.new_with_object(view_context, object, &content_block) }

    it "delegates to definition list" do
      subject.definition_list.should_receive(:to_s).and_return("html")
      expect(subject.to_s).to eq("html")
    end
  end
end