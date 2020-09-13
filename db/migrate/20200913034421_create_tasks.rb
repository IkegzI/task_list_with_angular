class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :text, null: false
      t.boolean :isCompleted, default: false
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
