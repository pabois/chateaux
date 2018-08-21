class Navigation::Navbar < SimpleNavigation::Renderer::Base
  def render(item_container)
    SimpleNavigation.config.selected_class = 'active'
    content = ''
    item_container.items.each do |item|
      content << make(item)
    end
    content.html_safe
  end

  protected

  def make(item)
    options = item.send :options
    icon = options[:icon]
    classes = item.html_options[:class]
    include_sub_navigation = consider_sub_navigation?(item)
    container = item.send :container
    level = container.send :level
    content = "
      <li"
    content += " class=\"#{classes}\"" unless classes.nil?
    content += '>'
    content += "<a href=\"#{item.url}\">"
    content += "<i class=\"#{options[:icon].to_s}\"></i>" if icon
    content += '<span class="nav-label">' if level == 1
    content += item.name
    content += '</span>' if level == 1
    content += '<span class="fa arrow"></span>' if include_sub_navigation
    content += '</a>'
    content += make_subnavigation(item) if include_sub_navigation
    content += '</li>'
    content
  end

  def make_subnavigation(item)
    content = '
      <ul class="nav nav-second-level collapse">'
    content += render_sub_navigation_for(item)
    content += '
      </ul>'
    content
  end
end
