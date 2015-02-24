class AddIndexToRoute < ActiveRecord::Migration
  def change
    add_index :routes, [:from, :to]
    add_index :routes, [:to, :from]
  end
end
