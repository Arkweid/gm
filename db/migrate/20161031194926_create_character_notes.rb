class CreateCharacterNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_notes do |t|
      t.belongs_to :character, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.text :note
      t.boolean :privacy

      t.timestamps
    end

    add_index :character_notes, [:character_id, :user_id]
  end
end
