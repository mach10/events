class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :start
      t.integer :owner

      t.timestamps
    end
  end
end
