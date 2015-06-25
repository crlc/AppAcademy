class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :song, null: false
      t.string :side, null: false
      t.string :lyrics, null: false
      t.integer :album_id, null: false

      t.timestamps null: false
    end
  end
end
