class JobTask < ApplicationRecord
  belongs_to :job

  enum state: [:created, :started, :finished]
end
