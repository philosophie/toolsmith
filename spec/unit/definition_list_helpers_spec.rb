require "spec_helper"

describe Toolsmith::ViewHelpers::DefinitionListHelpers do
  subject { AbstractActionView.new }

  context "#definitions" do
    let(:definition_list) { double("dl") }

    before do
      Toolsmith::Views::DefinitionList.should_receive(:new).with(subject).and_return(definition_list)
    end

    it "yields a defintion list object" do
      expect {|b| subject.definitions &b }.to yield_with_args(definition_list)
    end

    it "returns a definition list object" do
      expect(subject.definitions).to be definition_list
    end
  end
end