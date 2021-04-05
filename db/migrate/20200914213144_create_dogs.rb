class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :breed
      t.string :color
      t.integer :user_id
      t.boolean :cute
      t.boolean :heart
  end
end
end