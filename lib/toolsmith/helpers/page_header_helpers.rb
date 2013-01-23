module Toolsmith
  module ViewHelpers
    module PageHeaderHelpers
      def page_header(title, &block)
        page_header = Toolsmith::Views::PageHeader.new_with_title(title)
        yield page_header if block_given?
        page_header
      end
    end
  end
end