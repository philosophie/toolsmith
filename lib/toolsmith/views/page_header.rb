module Toolsmith
  module Views
    class PageHeader < Base
      attr_accessor :title, :subtitle

      def initialize(context, title, subtitle=nil)
        super(context)

        @title = title
        @subtitle = subtitle
      end

      def button(options)
        [:title, :icon, :path].each { |param| missing_parameter(param, options) }
        buttons << options
      end

      def buttons
        @buttons ||= []
      end

      def full_title
        subtitle ? ERB::Util.h(title) + content_tag(:small, subtitle) : ERB::Util.h(title)
      end

      def to_s
        content_tag(:h1) do
          content_tag(:div, nil, class: "pull-right") do
            content_tag(:div, class: "btn-group") do
              buttons.map do |button|
                context.link_to(button[:path], class: "btn", title: button[:title]) do
                  content_tag(:i, "", class: "icon-#{button[:icon]}")
                end
              end.inject("".html_safe, :+)
            end
          end + full_title
        end
      end
    end
  end
end