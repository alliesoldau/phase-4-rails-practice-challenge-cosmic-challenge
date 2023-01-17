class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_message
    #GET all
    def index
        scientists = Scientist.all
        render json: scientists, each_serializer: ScientistsSerializer, status: :ok
    end

    #GET one
    def show
        scientist = find_scientist
        render json: scientist, serializer: ScientistsWithPlanetsSerializer, status: :ok
    end

    #POST
    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, serializer: ScientistsSerializer, status: :accepted
    end

    #PATCH
    def update
        scientist = find_scientist
        scientist.update!(scientist_params)
        render json: scientist, serializer: ScientistsWithPlanetsSerializer, status: :accepted
    end

    #DELETE
    def destroy
        scientist = find_scientist
        scientist.destroy
        head :no_content
    end

    private

    def find_scientist
        Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def render_not_found_message
        render json: { errror: "Scientist not found" }, status: :not_found
    end

    def render_invalid_message (e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
