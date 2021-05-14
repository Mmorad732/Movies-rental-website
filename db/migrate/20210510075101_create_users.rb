class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password_digest
      t.integer :authentication ,default: 2

      t.timestamps
    end
    add_index :users, :email, unique: true

  end
end
