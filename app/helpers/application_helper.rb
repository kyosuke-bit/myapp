module ApplicationHelper
  def header_link_item(name, path)
    class_name = 'nav-link'
    class_name << ' active' if current_page?(path)

    content_tag :li, class: 'nav-item' do
      link_to name, path, class: class_name
    end
  end

  def active_if(path)
    path == controller_path ? 'active' : ''
  end
end
