class CreatePoemArchives < ActiveRecord::Migration
  def change
    create_table :poem_archives do |t|
      t.text :url

      t.timestamps null: false
    end
  end
end
