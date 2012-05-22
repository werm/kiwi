module ApplicationHelper
  def title(title)
    content_for :title do
      title.html_safe
    end
  end
end
