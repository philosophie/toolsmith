class AbstractActionView < ActionView::Base
  def initialize(*args)
    super

    self.controller = ApplicationController.new
    self.controller.request ||= ActionController::TestRequest.new
    self.request ||= self.controller.request
    self.params ||= {}
  end
end