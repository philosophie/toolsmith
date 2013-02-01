module Toolsmith
  module Views
    class DefinitionList < Base
      Definition = Struct.new(:term, :description)

      def definitions
        @definitions ||= []
      end

      def define(term, description)
        definitions << Definition.new(term, description)
      end

      def to_s
        content_tag :dl, list_body, class: "dl-horizontal"
      end

      private

      def list_body
        definitions.map do |definition|
          "#{content_tag :dt, definition.term}#{content_tag :dd, definition.description}".html_safe
        end.html_join
      end
    end
  end
end