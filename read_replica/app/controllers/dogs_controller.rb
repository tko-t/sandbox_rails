class DogsController < ApplicationController
  before_action :set_dog, only: %i[ show update destroy ]

  # GET /dogs
  def index
    timestamp = session[:last_write]
    delay = timestamp ? (Time.zone.now - (Time.at(timestamp / 1000, (timestamp % 1000) * 1000))).round(3) : 0

    render json: { role: ActiveRecord::Base.current_role, count: Dog.count, delay: }
  end

  # GET /dogs/1
  def show
    render json: @dog
  end

  # POST /dogs
  def create
    @dogs =  Dog.create(dog_params)
    render json: { role: ActiveRecord::Base.current_role }
  end

  # PATCH/PUT /dogs/1
  def update
    if @dog.update(dog_params)
      render json: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dogs/1
  def destroy
    @dog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dog_params
      params.require(:dog).permit(:name)
    end
end
