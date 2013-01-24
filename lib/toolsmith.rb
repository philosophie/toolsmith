require "toolsmith/view_helpers"
require "compass-rails"
require "bootstrap-sass"
require "toolsmith/engine" if defined?(Rails) && Rails.version >= "3.1"

module Toolsmith
  module Views
    autoload :Base, "toolsmith/views/base"
    autoload :PageHeader, "toolsmith/views/page_header"
    autoload :FlashDiv, "toolsmith/views/flash_div"
  end

  MissingParameter = Class.new(StandardError)
end
