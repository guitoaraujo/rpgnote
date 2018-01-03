class AddSystemToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :system, :integer
  end
end
