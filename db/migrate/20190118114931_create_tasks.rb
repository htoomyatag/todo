class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :duedate
      t.string :tstage
      t.string :tcategories, array: true, default: []
      t.string :coworker, array: true, default: []
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
