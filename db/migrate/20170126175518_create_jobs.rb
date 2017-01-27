class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :state
      t.references :customer, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
