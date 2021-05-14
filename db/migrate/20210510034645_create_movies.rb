class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :duration
      t.integer :year
      
      
      t.timestamps
    end
    add_index :movies, :title, unique: true
  end
end
