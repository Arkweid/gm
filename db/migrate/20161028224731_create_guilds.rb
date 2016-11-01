class CreateGuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :guilds do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :game, foreign_key: true
      t.string :title

      t.timestamps
    end

    add_index :guilds, [:user_id, :game_id]
  end
end
