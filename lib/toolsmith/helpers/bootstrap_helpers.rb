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
        FlashDiv.new(self, level)
      end

      # Renders a bootstrap-style alert message. Doesn't yet support levels.
      class FlashDiv
        attr_reader :context, :level

        def initialize(context, level)
          @context = context
          @level = level
        end

        def to_html
          if context.flash[level].present?
            container do
              close_link + context.flash[level].html_safe
            end
          end
        end

        def close_link
          context.link_to(
            close_link_text,
            "#",
            class: "close",
            data: {
              dismiss: "alert"
            }
          )
        end

        def close_link_text
          context.raw("&times;")
        end

        def container
          context.full_width_column do
            context.content_tag "div", class: "alert" do
              yield
            end
          end
        end

        def to_s
          to_html
        end
      end
    end
  end
end