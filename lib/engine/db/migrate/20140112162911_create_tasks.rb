class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :type
      t.string :value
      t.integer :every

      t.timestamps
    end
  end
end
