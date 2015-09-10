class AddGlossaryPageAndGlossaryTermToPoemArchive < ActiveRecord::Migration
  def change
    add_column :poem_archives, :glossary_url, :text
    add_column :poem_archives, :glossary_term, :string
  end
end
