class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :photo
      t.text :copy

      t.timestamps
    end
  end
end
