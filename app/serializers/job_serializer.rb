class JobSerializer < ActiveModel::Serializer
  attributes :uuid, :title, :state, :notes
  has_one :customer
end
