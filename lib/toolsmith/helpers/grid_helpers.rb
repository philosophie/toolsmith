module Toolsmith
  module ViewHelpers
    module GridHelpers
      def row(options={}, &block)
        row_class = options[:fluid] ? "row-fluid" : "row"
        content_tag(:div, class: row_class, &block)
      end

      def column(width, options = {}, &block)
        classes = %W[span#{width}]
        classes << "offset#{options[:offset]}" if options[:offset]

        content_tag(:div, class: classes,  &block)
      end

      def full_width_column(options={}, &block)
        row(options) do
          column(12, &block)
        end
      end
    end
  end
end