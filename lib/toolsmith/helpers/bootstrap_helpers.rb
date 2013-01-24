module Toolsmith
  module ViewHelpers
    module BootstrapHelpers
      FLASH_LEVELS = [:success, :error, :notice]

      def form_actions(&block)
        content_tag(:div, class: "form-actions", &block)
      end

      def flash_divs
        FLASH_LEVELS.map { |l| flash_div(l).to_s }.join.html_safe
      end

      def flash_div(level)
        Toolsmith::Views::FlashDiv.new(self, level)
      end
    end
  end
end