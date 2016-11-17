class AddAvatarUrlToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :avatar_link, :text, default: ""
  end
end
