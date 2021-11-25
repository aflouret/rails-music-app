class CreateReleases < ActiveRecord::Migration[6.1]
  def change
    create_table :releases do |t|
      t.string :title
      t.string :artist
      t.integer :year

      t.timestamps
    end
  end
end
