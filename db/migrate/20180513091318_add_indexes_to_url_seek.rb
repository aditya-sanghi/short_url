# frozen_string_literal: true

class AddIndexesToUrlSeek < ActiveRecord::Migration[5.1]
  def change
    add_index :url_relations, :short_version
    add_index :url_relations, :full_version
  end
end
