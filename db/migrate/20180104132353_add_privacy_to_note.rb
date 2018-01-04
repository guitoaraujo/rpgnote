class AddPrivacyToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :privacy, :integer
  end
end
