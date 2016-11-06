class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title, unique: true, null: false

      t.timestamps
    end

    add_index :games, :title
  end
end
