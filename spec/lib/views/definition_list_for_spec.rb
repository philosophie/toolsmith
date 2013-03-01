require "spec_helper"

describe Toolsmith::Views::DefinitionListFor do
  let(:view_context) { AbstractActionView.new }
  let(:object) { double("object", attribute_name: "Attribute Value") }

  subject { described_class.new(view_context) }

  it "has an object attribute" do
    expect(subject).to respond_to :object
    expect(subject).to respond_to :object=
  end

  context ".new_with_object" do
    it "instantiates and sets the object on the instance" do
      definition_list = described_class.new_with_object(view_context, object)
      expect(definition_list.object).to be(object)
    end
  end

  context "#define" do
    subject { described_class.new_with_object(view_context, object) }

    it "returns the term tag for an attribute" do
      tags = subject.define :attribute_name
      expect(tags).to have_xpath("//dt[contains(., 'Attribute name')]")
    end

    it "returns the definition tag for an attribute" do
      tags = subject.define :attribute_name
      expect(tags).to have_xpath("//dd[contains(., 'Attribute Value')]")
    end
  end

  context "#to_s" do
    let(:content_block) { ->(dl) { dl.define :attribute_name } }
    subject { described_class.new_with_object(view_context, object, &content_block) }

    it "captures the content block with the definition list" do
      definition_list = subject.to_s
      expect(definition_list).to have_xpath "//dl/dt[contains(., 'Attribute name')]"
      expect(definition_list).to have_xpath "//dl/dd[contains(., 'Attribute Value')]"
    end
  end
end