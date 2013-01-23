module Toolsmith
  module ViewHelpers
    module PageHeaderHelpers
      def page_header_with_buttons(title, &block)
        header = Toolsmith::Views::PageHeader.new_with_title(self, title)
        yield header if block_given?
        header
      end
    end
  end
end