class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :year
      t.integer :user_id
    end
  end
end
