class AddCategoryToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :category, :string
  end
end
