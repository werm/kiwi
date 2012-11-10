module ApplicationHelper
  def title(title)
    content_for :title do
      title.downcase.html_safe
    end
  end
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end  
end
