class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.integer :author_id, null: false
      t.integer :guild_id, null: false
      t.string :title, null: false
      t.text :short_content
      t.text :content
      t.boolean :published, default: false

      t.timestamps
    end

    add_index :news, :guild_id
  end
end
