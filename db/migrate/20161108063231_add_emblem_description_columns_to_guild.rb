class AddEmblemDescriptionColumnsToGuild < ActiveRecord::Migration[5.0]
  def change
    add_column :guilds, :description, :text, default: ""
    add_column :guilds, :emblem_link, :text, default: ""
  end
end
