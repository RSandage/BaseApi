class CreateEncounters < ActiveRecord::Migration[6.1]
  def change
    create_table :encounters do |t|
      t.string :title
      t.boolean :public
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
