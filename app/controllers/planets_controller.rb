class PlanetsController < ApplicationController

    #GET all
    def index
        planets = Planet.all
        render json: planets, each_serializer: PlanetsSerializer, status: :ok
    end
    
end
