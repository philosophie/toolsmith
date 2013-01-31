module Toolsmith
  module ViewHelpers
    module PageHeaderHelpers
      def page_header(title, *args, &block)
        options = args.extract_options!
        subtitle = options.first

        header = Toolsmith::Views::PageHeader.new(self, title, subtitle)
        yield header if block_given?

        full_width_column(options) do
          header.to_s
        end
      end
    end
  end
end