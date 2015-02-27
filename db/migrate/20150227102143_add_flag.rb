class AddFlag < ActiveRecord::Migration
  def change
    add_column :routes, :tried, :boolean, default: false, after: :transfers5
  end
end
