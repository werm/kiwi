class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :html
      t.text :css

      t.timestamps
    end
  end
end
