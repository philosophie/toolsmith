require "spec_helper"

describe Toolsmith::Views::Base do
  let(:view_context) { AbstractActionView.new }

  context "#initialize" do
    it "yields a block" do
      expect {|b| described_class.new(view_context, &b) }.to yield_control
    end

    it "takes a view context" do
      base = described_class.new(view_context)
      expect(base.context).to be_kind_of ActionView::Base
    end
  end
end