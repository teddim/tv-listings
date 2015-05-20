class ChangeShowlistings < ActiveRecord::Migration
  def change
    add_column :show_listings, :date, :date
  end
end
