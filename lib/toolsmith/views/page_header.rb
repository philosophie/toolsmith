module Toolsmith
  module Views
    class PageHeader < Base
      attr_accessor :title, :subtitle, :options

      def initialize(context, title, *args)
        super(context)

        @options = args.extract_options!
        @title = title
        @subtitle = args.first
      end

      def button(*args)
        button_options = args.size >= 3 ? button_options(*args) : args.shift
        buttons << button_options

        button_options
      end

      def button_markup(options)
        anchor_options = options.fetch(:anchor, {})
        context.link_to options[:path], anchor_options.merge(class: "btn", title: options[:title]) do
          content_tag :i, "", class: "icon-#{options[:icon]}"
        end
      end

      def buttons
        @buttons ||= []
      end

      def full_title
        subtitle ? "#{ERB::Util.h(title)} #{content_tag(:small, self.subtitle)}".html_safe : ERB::Util.h(title)
      end

      def to_s
        content_tag :div, h1_tag, class: "page-header"
      end

      private

      def h1_tag
        content_tag(:h1) do
          content_tag(:div, button_group, class: "pull-right") +
            full_title
        end
      end

      def button_group
        content_tag(:div, class: "btn-group") do
          buttons.map do |button|
            button_markup(button)
          end.html_join
        end
      end

      def button_options(title, path, icon, options={})
        options.merge(title: title, path: path, icon: icon)
      end
    end
  end
end