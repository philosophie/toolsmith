module Toolsmith
  module ViewHelpers
    module GridHelpers

      # Generates a grid row.
      #
      # ```
      # <%= row do %>
      #   Content
      # <% end %>
      # ```
      # Will output:
      #
      # ```
      # <div class="row">
      #   Content
      # </div>
      # ```
      # @param options [Hash]
      # @return [String] `<div class="row">Content</div>`
      def row(options={}, &block)
        row_class = options[:fluid] ? "row-fluid" : "row"
        content_tag(:div, class: row_class, &block)
      end

      # Returns a grid column element.
      #
      # ```
      # <%= column 12 do %>
      #   I'm in a column!
      # <% end %>
      # ```
      # Will output:
      #
      # ```
      # <div class="span12">
      #   I'm in a column!
      # </div>
      # ```
      #
      # @param width [Fixnum]
      # @param options [Hash]
      # @return [String]
      def column(width, options = {}, &block)
        classes = %W[span#{width}]
        classes << "offset#{options[:offset]}" if options[:offset]

        content_tag(:div, class: classes,  &block)
      end

      # Create a row and fullwidth column (based on the standard 12 wide)
      #
      # ```
      # <%= full_width_column do %>
      #   My more-to-love column.
      # <% end %>
      # ```
      # Will output:
      #
      # ```
      # <div class="row">
      #   <div class="span12">
      #     My more-to-love column.
      #   </div>
      # </div>
      # ```
      # @see #row
      # @see #column
      def full_width_column(options={}, &block)
        row(options) do
          column(12, &block)
        end
      end
    end
  end
end