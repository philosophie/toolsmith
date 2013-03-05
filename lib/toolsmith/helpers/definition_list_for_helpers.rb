module Toolsmith
  module ViewHelpers
    module DefinitionListForHelpers
      def definition_list_for(object, options={}, &block)
        definition_list = Toolsmith::Views::DefinitionListFor.new_with_object(self, object, &block)
        definition_list.options.merge!(options)
        definition_list
      end
    end
  end
end