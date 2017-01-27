class SetDefaultToStates < ActiveRecord::Migration[5.0]
  def change
    change_column_default :jobs, :state, 0
    change_column_default :job_tasks, :state, 0

    change_column_null :jobs, :state, false
    change_column_null :job_tasks, :state, false
  end
end
