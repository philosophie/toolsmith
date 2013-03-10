module Toolsmith
  module Views
    class FlashDiv < Base
      LEVEL_MAPPING = {
        error: :error,
        alert: :error,
        success: :success,
        notice: :info
      }

      attr_reader :level
      attr_reader :view_level

      def initialize(context, level)
        super(context)
        @level = level
        @view_level = LEVEL_MAPPING[level]
      end

      def to_s
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

      def container
        context.full_width_column do
          content_tag :div, class: "alert alert-#{view_level}" do
            yield
          end
        end
      end

      def close_link_text
        context.raw("&times;")
      end
    end
  end
end
