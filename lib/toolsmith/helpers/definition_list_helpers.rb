module Toolsmith
  module ViewHelpers
    module DefinitionListHelpers
      def definitions(&block)
        definition_list = Toolsmith::Views::DefinitionList.new(self)
        yield definition_list if block_given?
        definition_list
      end
    end
  end
end