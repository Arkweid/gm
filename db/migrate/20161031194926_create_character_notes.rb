class CreateCharacterNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_note do |t|
      t.belongs_to :character, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.text :note, null: false
      t.boolean :privacy, default: false

      t.timestamps
    end

    add_index :character_note, [:character_id, :user_id]
  end
end
