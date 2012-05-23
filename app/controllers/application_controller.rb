class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_snippets

  private

  def load_snippets
    @categories = Snippet.select(:category).uniq
    @categories.map! { |s| s.category }
  end
end
