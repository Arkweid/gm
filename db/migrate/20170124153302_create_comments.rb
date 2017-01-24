class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.boolean :privacy, default: false
      t.references :commentable, polymorphic: true
      t.references :character, index: true, foreign_key: true
      t.timestamps
    end

    add_index :comments, [:commentable_id, :commentable_type]
  end
end
