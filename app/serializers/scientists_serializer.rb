class ScientistsSerializer < ActiveModel::Serializer
  attributes :id, :name, :field_of_study, :avatar
end
