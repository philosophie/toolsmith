module Toolsmith
  module Views
    class DefinitionList < Base
      DEFAULT_CLASS = "dl-horizontal"

      attr_reader :content_block, :options

      def initialize(context, options={}, &block)
        @content_block = block if block_given?
        @options = options
        super(context, &nil)
      end

      def define(term, description)
        description = description.blank? ? " " : description
        content_tag(:dt, term) + content_tag(:dd, description)
      end

      def to_s
        content = context.capture(self, &content_block)
        content_tag :dl, content, dl_options
      end

      private

      def dl_options
        { class: !options[:horizontal] ? DEFAULT_CLASS : "" }
      end
    end
  end
end