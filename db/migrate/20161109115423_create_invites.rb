class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.belongs_to :character, foreign_key: true, index: true
      t.belongs_to :guild, foreign_key: true, index: true
      t.string :state

      t.text :description, default: ''

      t.timestamps
    end
  end
end
