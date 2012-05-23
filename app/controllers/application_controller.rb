class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_snippets

  check_authorization
  rescue_from CanCan::AccessDenied do |exc|
    redirect_to root_path, alert: exc.message
  end

  private

  def load_snippets
    @categories = Snippet.select(:category).uniq
    @categories.map! { |s| s.category }
    @snippet_count = Snippet.count
  end

  def current_user
    true
  end
end
