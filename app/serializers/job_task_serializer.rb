class JobTaskSerializer < ActiveModel::Serializer
  attributes :uuid, :title, :state, :notes
  has_one :job
end
