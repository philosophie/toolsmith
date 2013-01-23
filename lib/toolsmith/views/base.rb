module Toolsmith
  module Views
    class Base
      attr_reader :context

      def initialize(context, &block)
        @context = context

        if block_given?
          block.arity > 0 ? block.call(self) : yield
        end
      end

      def content_tag(*args, &block)
        context.content_tag(*args, &block)
      end

      private

      def missing_parameter(key, params)
        unless params[key]
          raise Toolsmith::MissingParameter, "Missing parameter: #{key}"
        end
      end
    end
  end
end