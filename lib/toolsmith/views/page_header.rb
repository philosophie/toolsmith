module Toolsmith
  module Views
    class PageHeader < Base
      attr_accessor :title

      def self.new_with_title(context, title)
        new(context).tap do |header|
          header.title = title
        end
      end

      def button(options)
        [:title, :icon, :path].each { |param| missing_parameter(param, options) }
        buttons << options
      end

      def buttons
        @buttons ||= []
      end

      def to_s
        ERB::Util.html_escape(title) + content_tag(:div, nil, class: "pull-right") do
          content_tag(:div, class: "btn-group") do
            buttons.map do |button|
              context.link_to(button[:path], class: "btn", title: button[:title]) do
                content_tag(:i, "", class: "icon-#{button[:icon]}")
              end
            end.inject("".html_safe, :+)
          end
        end
      end
    end
  end
end