class RenameFullVersion < ActiveRecord::Migration[5.1]
  def change
    rename_column :url_relations, :full_version, :input_url
  end
end
