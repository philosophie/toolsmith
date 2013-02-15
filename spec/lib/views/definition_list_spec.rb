require "spec_helper"

describe Toolsmith::Views::DefinitionList do
  let(:view_context) { AbstractActionView.new }
  let(:content_block) do
    Proc.new {|dl| dl.define("Term", "Definition") }
  end

  subject { described_class.new(view_context) }

  context "#initialize" do
    it "accepts a view" do
      expect { described_class.new(view_context) }.not_to raise_error
    end

    it "accepts a block" do
      expect { described_class.new(view_context, &content_block) }.not_to raise_error
    end

    it "accepts options" do
      definitions = described_class.new(view_context, horizontal: true)
      expect(definitions.options).to have_key :horizontal
    end
  end

  context "#define" do
    it "returns a definition" do
      definition = subject.define("Term", "Description")
      expect(definition).to have_xpath "//dt[contains(text(), 'Term')]"
      expect(definition).to have_xpath "//dd[contains(text(), 'Description')]"
    end

    it "replaces with a space if definition is nil" do
      definition = subject.define("Term", nil)
      expect(definition).to have_xpath("//dd[contains(., ' ')]")
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

    it "returns a horizontal list by default" do
      expect(definition_list.to_s).to have_xpath "//dl[contains(@class, 'dl-horizontal')]"
    end

    it "returns a non-horizontal list" do
      definition_list.stub(:dl_options).and_return({})
      expect(definition_list.to_s).to have_xpath "//dl[not(@class)]"
    end
  end
end