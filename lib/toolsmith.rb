require "toolsmith/view_helpers"
require "toolsmith/railtie" if defined?(Rails)
require "toolsmith/engine" if defined?(Rails) && Rails.version >= '3.1'

module Toolsmith
end
