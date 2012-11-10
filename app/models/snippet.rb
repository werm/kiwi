class Snippet < ActiveRecord::Base
  attr_accessible :css, :html, :javascript, :name, :slug, :category

  validates_presence_of :name, :slug, :category
  validates_uniqueness_of :name, :slug

  before_validation :generate_slug

  def to_param
    slug
  end

  def full_source
    source = <<-SRC
      <style type="text/css">
        #{css}
      </style>
      #{html}
    SRC
    source.html_safe
  end

  private

  def generate_slug
    self.slug = name.parameterize if self.slug.nil?
  end
end
