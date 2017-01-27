class Job < ApplicationRecord
  belongs_to :customer
  has_many :job_tasks

  enum status: [:created, :started, :finished]

end
