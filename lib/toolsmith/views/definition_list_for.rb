module Toolsmith
  module Views
    class DefinitionListFor < Base
      attr_accessor :object, :options
      attr_reader :content_block

      DEFAULT_OPTIONS = { horizontal: true }

      def initialize(context, &block)
        @content_block = block if block_given?
        @options = DEFAULT_OPTIONS.dup
        super(context, &nil)
      end

      def self.new_with_object(context, object, &block)
        definition_list = new(context, &block)
        definition_list.object = object
        definition_list
      end

      def define(attribute)
        human_attribute = attribute.to_s.humanize

        content_tag(:dt, human_attribute) + content_tag(:dd, object.send(attribute))
      end

      def to_s
        content = context.capture(self, &content_block)
        content_tag :dl, content, dl_options
      end

      def dl_options
        {
          class: options[:horizontal] ? "dl-horizontal" : nil
        }
      end
    end
  end
end