module ApplicationHelper
  
  def section(title, &block)
    content_tag(:div, :class=>'title'){content_tag(:h2, title)} +
    content_tag(:div, :class=>'body'){capture(&block)}
  end
  
end
