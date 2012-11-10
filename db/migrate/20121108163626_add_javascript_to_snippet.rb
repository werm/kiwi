class AddJavascriptToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :javascript, :text
  end
end
