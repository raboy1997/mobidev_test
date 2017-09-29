class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :kind
      t.string :gid

      t.timestamps
    end
  end
end
