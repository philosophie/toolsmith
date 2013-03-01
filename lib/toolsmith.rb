require "toolsmith/view_helpers"
require "compass-rails"
require "bootstrap-sass"
require "toolsmith/engine" if defined?(Rails) && Rails.version >= "3.1"

require "toolsmith/core_ext/array"

module Toolsmith
  module Views
    autoload :Base, "toolsmith/views/base"
    autoload :PageHeader, "toolsmith/views/page_header"
    autoload :FlashDiv, "toolsmith/views/flash_div"
    autoload :DefinitionList, "toolsmith/views/definition_list"
    autoload :DefinitionListFor, "toolsmith/views/definition_list_for"
  end

  MissingParameter = Class.new(StandardError)
end
