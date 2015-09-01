class AddAuthorToPoemArchive < ActiveRecord::Migration
  def change
    add_column :poem_archives, :author, :string
  end
end
