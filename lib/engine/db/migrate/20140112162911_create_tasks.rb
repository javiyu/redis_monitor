class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :type
      t.string :trigger
      t.integer :database, default: 0
      t.integer :every
      t.string :status, default: ''
      t.text :data

      t.timestamps
    end
  end
end
