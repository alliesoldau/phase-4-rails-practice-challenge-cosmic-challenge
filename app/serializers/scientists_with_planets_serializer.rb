class ScientistsWithPlanetsSerializer < ActiveModel::Serializer
  attributes :id, :name, :field_of_study, :avatar
  has_many :planets, serializer: PlanetsSerializer
end
