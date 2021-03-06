module Toolsmith
  module Views
    class DefinitionList < Base
      DEFAULT_OPTIONS = { horizontal: true }

      attr_reader :content_block, :options

      def initialize(context, options={}, &block)
        @content_block = block if block_given?
        @options = DEFAULT_OPTIONS.merge(options)
        super(context, &nil)
      end

      def define(term, description)
        description = description.blank? ? "&nbsp;".html_safe : description
        content_tag(:dt, term) + content_tag(:dd, description)
      end

      def to_s
        content = context.capture(self, &content_block)
        content_tag :dl, content, dl_options
      end

      private

      def dl_options
        {
          class: options[:horizontal] ? "dl-horizontal" : nil
        }
      end
    end
  end
end