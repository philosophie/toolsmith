module Toolsmith
  class Railtie < Rails::Railtie
    initializer "toolsmith.view_extension" do
      ActiveSupport.on_load(:action_view) do
        include Toolsmith::ViewHelpers
      end
    end
  end
end