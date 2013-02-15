require "spec_helper"

describe Toolsmith::Views::DefinitionList do
  let(:view_context) { AbstractActionView.new }
  let(:content_block) do
    Proc.new {|dl| dl.define("Term", "Definition") }
  end

  subject { described_class.new(view_context) }

  context "#initialize" do
    it "accepts a view" do
      expect { described_class.new(subject) }.not_to raise_error
    end

    it "accepts a block" do
      expect { described_class.new(subject, &content_block) }.not_to raise_error
    end
  end

  context "#define" do
    it "returns a definition" do
      definition = Nokogiri::HTML(subject.define("Term", "Description"))
      expect(definition.at_xpath("//dt[contains(text(), 'Term')]")).to be_present
      expect(definition.at_xpath("//dd[contains(text(), 'Description')]")).to be_present
    end
  end

  context "#to_s" do
    let(:definition_list) do
      described_class.new(view_context, &content_block)
    end

    it "captures the block with definitions" do
      view_context.should_receive(:capture).with(instance_of(definition_list.class)).once
      definition_list.to_s
    end
  end
end