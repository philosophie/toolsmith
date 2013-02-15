module Toolsmith
  module Views
    class DefinitionList < Base
      attr_reader :content_block

      def initialize(context, &block)
        @content_block = block if block_given?
        super(context, &nil)
      end

      def define(term, description)
        content_tag(:dt, term) + content_tag(:dd, description)
      end

      def to_s
        content = context.capture(self, &content_block)
        content_tag :dl, content
      end
    end
  end
end