class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  def index
    @cars = policy_scope(Car)
  end

  def show
  end

  def new
    @car = Car.new
    authorize @car
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    authorize @car
      if @car.save
        redirect_to cars_path, notice: "Car was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    @car.update(car_params)
    redirect_to car_path(@car), notice: "Car was successfully updated."
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: "Car was successfully destroyed."
  end

  private

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :price, :address)
  end
end
