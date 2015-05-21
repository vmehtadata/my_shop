module NavbarHelper
  class NavbarBuilder
    attr_reader :t

    def initialize(template)
      @t = template
    end

    def brand_tag(content, url, options = {})
      t.link_to(content, url, { class: 'navbar-brand' }.merge(options))
    end

    def navbar_tag(options = {}, &block)
    	css = "nav navbar-nav #{options.delete(:class)}".strip
      t.content_tag(:ul, { class: css }.merge(options)) do
        yield self
      end
    end

    def navbar_item_tag(content, url, link_options = {})
      t.content_tag(:li, navbar_item_attrs(url)) do
        t.link_to(content, url, link_options)
      end
    end

    private

    def navbar_item_attrs(url)
      current_page?(url) ? { class: 'active' } : {}
    end

    def current_page?(url)
      %r[\A#{url}] =~ t.request.path
    end
  end

  def navbar(options = {}, &block)
    builder = NavbarBuilder.new(self)
    content_tag(:div, { class: 'container' }.merge(options)) do
      yield builder
    end
  end
end