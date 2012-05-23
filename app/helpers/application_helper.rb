module ApplicationHelper
  def title(title)
    content_for :title do
      title.downcase.html_safe
    end
  end
end
