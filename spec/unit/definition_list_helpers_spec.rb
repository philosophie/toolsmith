require "spec_helper"

describe Toolsmith::ViewHelpers::DefinitionListHelpers do
  subject { AbstractActionView.new }
  let(:content_block) do
    Proc.new do |dl|
      subject.output_buffer << dl.define("Term", "Definition")
      subject.output_buffer << "<dt>Another</dt><dd>Definition 2</dd>".html_safe
    end
  end

  context "#definition_list" do
    it "accepts options" do
      expect { subject.definition_list(wut: true) }.not_to raise_error
    end

    it "captures buffered content" do
      content = subject.definition_list(&content_block).to_s

      expect(content).to have_xpath "//dl/dt[contains(., 'Term')]"
      expect(content).to have_xpath "//dl/dd[contains(., 'Definition')]"

      expect(content).to have_xpath "//dl/dt[contains(., 'Another')]"
      expect(content).to have_xpath "//dl/dd[contains(., 'Definition 2')]"
    end
  end
end