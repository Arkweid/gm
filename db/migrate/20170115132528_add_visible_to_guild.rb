class AddVisibleToGuild < ActiveRecord::Migration[5.0]
  def change
    add_column :guilds, :visible, :boolean
  end
end
