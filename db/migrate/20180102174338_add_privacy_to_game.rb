class AddPrivacyToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :privacy, :integer
  end
end
