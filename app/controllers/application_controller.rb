class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_snippets

  private

  def load_snippets
    @snippets = Snippet.all
  end
end
