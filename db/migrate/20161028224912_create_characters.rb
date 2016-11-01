class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :game, foreign_key: true
      t.integer :guild_id

      t.string :name
      t.integer :guild_rank
      t.text :description

      t.timestamps
    end

    add_index :characters, [:user_id, :game_id]
  end
end
