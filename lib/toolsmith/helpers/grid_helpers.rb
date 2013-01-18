module Toolsmith
  module ViewHelpers
    module GridHelpers
      def row(&block)
        content_tag(:div, class: "row", &block)
      end

      def column(width, options = {}, &block)
        classes = %W[span#{width}]
        classes << "offset#{options[:offset]}" if options[:offset]

        content_tag(:div, class: classes,  &block)
      end

      def full_width_column(&block)
        row do
          column(12, &block)
        end
      end
    end
  end
end