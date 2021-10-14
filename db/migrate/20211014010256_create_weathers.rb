class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.string :zip, null: false
      t.jsonb :data, null: false

      t.timestamps
    end
    add_index :weathers, :zip, unique: true
  end
end
