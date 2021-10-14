# frozen_string_literal: true

class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.string :zip, null: false
      t.jsonb :data

      t.timestamps
    end
    add_index :weathers, :zip, unique: true
  end
end
