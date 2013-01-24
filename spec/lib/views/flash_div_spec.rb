require "spec_helper"

describe Toolsmith::Views::FlashDiv do
  let(:view_context) { AbstractActionView.new }

  context "#initialize" do
    it "maps the flash level to a bootstrap class" do
      flash = described_class.new(view_context, :notice)
      expect(flash.view_level).to be :info
    end
  end

  context "#to_s" do
    subject { described_class.new(view_context, :success) }
    let(:element) { subject.to_s }

    before do
      view_context.flash.now[:success] = "Success!"
    end

    it "renders a div with an alert class" do
      expect(element).to have_tag "div.row div.alert"
    end

    it "renders a div with a success class" do
      expect(element).to have_tag "div.row div.alert.alert-success"
    end

    it "renders a dismissal anchor" do
      expect(element).to have_tag "div.row div.alert a.close[data-dismiss=alert]"
    end
  end
end