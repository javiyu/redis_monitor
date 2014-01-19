class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :reporter, default: ''
      t.text :message, default: ''

      t.timestamps
    end
  end
end
