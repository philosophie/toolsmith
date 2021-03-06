module Toolsmith
  class Engine < ::Rails::Engine
    initializer "toolsmith.view_extension" do
      ActiveSupport.on_load(:action_view) do
        include Toolsmith::ViewHelpers
      end
    end
  end
end