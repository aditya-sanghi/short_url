# frozen_string_literal: true

class CreateUserRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :user_requests do |t|
      t.string :ip
      t.string :browser_name
      t.string :browser_version
      t.string :platform_name
      t.string :platform_version
      t.references :url_relation, foreign_key: true
      t.timestamps
    end
  end
end
