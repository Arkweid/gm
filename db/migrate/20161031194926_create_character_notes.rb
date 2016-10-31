class CreateCharacterNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_notes do |t|
      t.integer :character_id
      t.integer :user_id

      t.text :note
      t.boolean :privacy

      t.timestamps
    end
  end
end
