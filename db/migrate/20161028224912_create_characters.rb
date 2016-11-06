class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :game, foreign_key: true
      t.integer :guild_id

      t.string :name, null: false
      t.integer :guild_rank, default: 0
      t.text :description, default: ''

      t.timestamps
    end

    add_index :characters, [:user_id, :game_id]
  end
end
