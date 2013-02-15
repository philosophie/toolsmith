module Toolsmith
  module ViewHelpers
    module DefinitionListHelpers
      # Generates a Definition List
      #
      # ```
      # <%= definition_list do |dl| %>
      #   <%= dl.define "Name", "Robert Ross" %>
      # <% end %>
      # ```
      #
      # Will output:
      #
      # ```
      # <dl class="dl-horizontal">
      #   <dt>Name</dt><dd>Robert Ross</dd>
      # </dl>
      # ```
      #
      def definition_list(options={}, &block)
        Toolsmith::Views::DefinitionList.new(self, options, &block)
      end
    end
  end
end