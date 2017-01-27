class CustomerSerializer < ActiveModel::Serializer
  attributes :uuid, :full_name, :address, :notes
end