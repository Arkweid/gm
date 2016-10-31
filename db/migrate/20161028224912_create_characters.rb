class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :guild_id

      t.string :name
      t.integer :guild_rank
      t.text :description

      t.timestamps
    end
  end
end
