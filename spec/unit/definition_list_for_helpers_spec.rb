require "spec_helper"

describe Toolsmith::ViewHelpers::DefinitionListForHelpers do
  subject { AbstractActionView.new }
  let(:content_block) { ->(dl) { dl.define :attribute_name } }
  let(:object) { double("object", attribute_name: "value") }

  context "#definition_list_for" do
    it "yields a definition list for object" do
      expect {|b| subject.definition_list_for(object, &b) }.to yield_with_args(instance_of(Toolsmith::Views::DefinitionListFor))
    end

    it "returns the content of the definition list when calling #to_s" do
      dl = subject.definition_list_for(object, &content_block).to_s

      expect(dl).to have_xpath("//dl/dt[contains(., 'Attribute name')]")
      expect(dl).to have_xpath("//dl/dd[contains(., 'value')]")
    end

    it "takes options" do
      options = {horizontal: false}
      dl = subject.definition_list_for(object, options, &content_block)
      expect(dl.options).to eq(options)
    end
  end
end