class CreateJobTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :job_tasks do |t|
      t.string :title
      t.integer :state
      t.references :job, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
