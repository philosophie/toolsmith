module Toolsmith
  module ViewHelpers
    module DefinitionListForHelpers
      def definition_list_for(object, &block)
        definition_list = Toolsmith::Views::DefinitionListFor.new_with_object(self, object, &block)
        yield definition_list
        definition_list
      end
    end
  end
end