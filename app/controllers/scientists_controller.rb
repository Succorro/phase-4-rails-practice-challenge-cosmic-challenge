class ScientistsController < ApplicationController

    # before_action :one_scientist, only: [:show, :update, :destroy]


    def index
        render json: Scientist.all
    end

    def show
        render json: one_scientist, serializer: ScientistWithPlanetsSerializer
    end

    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    def update
        one_scientist.update!(scientist_params)
        render json: one_scientist, status: :accepted
    end

    def destroy
        one_scientist.destroy
        head :no_content
    end

    private

    def one_scientist
        Scientist.find(params[:id])

    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end
end
