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
        message: 'propriété ajoutée',
        property: @property
      }
    else
      error_formatter(@property)
    end
  end

  def update
    puts current_user.id
    puts @property.user.id

    if current_user.id != @property.user.id
      @property.errors.add(:user, :not_owner)
      error_formatter(@property)
    elsif @property.update(property_params)
      render json: {
        message: 'propriété mise a jour avec succes',
        property: @property
      }
    else
      error_formatter(@property)
    end
  end

  def destroy
    if current_user != @property.user
      @property.errors.add(:user, :not_owner)
      error_formatter(@property)
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
