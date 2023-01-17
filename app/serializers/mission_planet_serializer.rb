class MissionPlanetSerializer < ActiveModel::Serializer
  has_one :planet, serializer: PlanetsSerializer
end
