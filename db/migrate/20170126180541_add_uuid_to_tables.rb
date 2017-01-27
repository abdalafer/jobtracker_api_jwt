class AddUuidToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :uuid, :uuid, default: "uuid_generate_v4()", null: false
    add_column :job_tasks, :uuid, :uuid, default: "uuid_generate_v4()", null: false
    add_column :jobs, :uuid, :uuid, default: "uuid_generate_v4()", null: false
  end
end
