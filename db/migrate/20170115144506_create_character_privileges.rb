class CreateCharacterPrivileges < ActiveRecord::Migration[5.0]
  def change
    create_table :character_privileges do |t|
      t.integer :character_id, null: false
      t.string :granted_modules, array: true, default: []

      t.timestamps
    end

    add_index :character_privileges, :character_id
  end
end
