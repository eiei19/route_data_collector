class CreateDataTable < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :from
      t.string :to
      t.integer :minutes1
      t.integer :transfers1
      t.integer :minutes2
      t.integer :transfers2
      t.integer :minutes3
      t.integer :transfers3
      t.integer :minutes4
      t.integer :transfers4
      t.integer :minutes5
      t.integer :transfers5
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :routes, :from
    add_index :routes, :to
  end
end
