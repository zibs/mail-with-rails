class AddTitleToPoemArchive < ActiveRecord::Migration
  def change
    add_column :poem_archives, :title, :string
  end
end
