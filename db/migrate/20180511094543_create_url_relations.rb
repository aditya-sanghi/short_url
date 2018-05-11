class CreateUrlRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :url_relations do |t|
      t.string :short_version, null: false
      t.string :full_version, null: false
      t.timestamps
    end
  end
end
