module Toolsmith
  module ViewHelpers
    module DefinitionListHelpers
      def definition_list(&block)
        Toolsmith::Views::DefinitionList.new(self, &block)
      end
    end
  end
end