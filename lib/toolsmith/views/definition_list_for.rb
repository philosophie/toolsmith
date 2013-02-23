module Toolsmith
  module Views
    class DefinitionListFor < Base
      attr_accessor :definition_list, :object

      def self.new_with_object(context, object, &block)
        new(context).tap do |dl|
          dl.definition_list = DefinitionList.new(context, &block)
          dl.object = object
        end
      end

      def define(attribute)
        definition_list.define term_text(attribute), object.send(attribute)
      end

      def to_s
        definition_list.to_s
      end

      private

      def term_text(attribute)
        if object.class.respond_to?(:human_attribute_name)
          object.class.human_attribute_name(attribute)
        else
          attribute.to_s.humanize
        end
      end
    end
  end
end