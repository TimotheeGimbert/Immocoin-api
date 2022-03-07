class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]

  def index
    @properties = Property.all
    render json: {
      properties: @properties
    }
  end

  def show
    render json: {
      property: @property
    }
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      render json: {
        message: 'property added !',
        property: @property
      }
    else
      render json: {
        message: 'something went wrong'
      }
    end
  end

  def update
    puts current_user.id
    puts @property.user.id

    if current_user.id != @property.user.id
      render json: {
        message: 'properties can only be modified by their owners'
      }
    elsif @property.update(property_params)
      render json: {
        message: 'property updated successfully',
        property: @property
      }
    else
      render json: {
        message: 'something went wrong !'
      }
    end
  end

  def destroy
    if current_user != @property.user
      render json: {
        message: 'properties can only be deleted by their owners'
      }
    else
      @property.destroy
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:title, :description, :price, :address)
  end
end
