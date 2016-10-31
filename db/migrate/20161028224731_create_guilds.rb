class CreateGuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :guilds do |t|
      t.integer :user_id

      t.string :title

      t.timestamps
    end
  end
end
