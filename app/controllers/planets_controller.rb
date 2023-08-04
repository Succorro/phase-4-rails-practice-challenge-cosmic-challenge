class PlanetsController < ApplicationController

  def index
    render json: Planet.all
end

def show
    render json: one_planet
end

def create
    planet = Planet.create!(planet_params)
    render json: planet, status: :created
end

def update
    one_planet.update!(planet_params)
    render json: one_planet, status: :accepted
end

def destroy
    one_planet.destroy
    head :no_content
end

private 
def one_planet 
  Planet.find(params[:id])
end 
def planet_params
  params.permit(:name, :distance_from_earth, :nearest_star, :image)
end
end
