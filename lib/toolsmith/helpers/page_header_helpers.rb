module Toolsmith
  module ViewHelpers
    module PageHeaderHelpers
      def page_header(title, subtitle=nil, &block)
        header = Toolsmith::Views::PageHeader.new(self, title, subtitle)
        yield header if block_given?

        full_width_column do
          header.to_s
        end
      end
    end
  end
end