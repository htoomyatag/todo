class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :duedate
      t.string :tstage
      t.string :tcategory
      t.integer :coworker
      t.integer :creator

      t.timestamps null: false
    end
  end
end
