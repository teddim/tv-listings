class CreateChannel < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
    end
  end
end
