class MissionPlanetSerializer < ActiveModel::Serializer
  attributes :planet_attributes

  def planet_attributes
    object.planet
  end
end
