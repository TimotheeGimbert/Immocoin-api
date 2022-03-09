class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :get_endpoints, only: %i[index]

  def index
    @properties = []
    Property.all.order("created_at DESC").limit(@limit).offset(@offset).each do |property|
      @properties << {
        property: property,
        picture: rails_blob_url(property.picture)
      }
    end
    render json: {
      properties: @properties
    }
  end

  def show
    property_data
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      property_data('propriété ajoutée')
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
      property_data('propriété mise a jour avec succes')
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
    params.permit(:title, :description, :price, :address, :picture)
  end

  def property_data(message = nil)
    render json: {
      message: message,
      property: @property,
      user: @property.user,
      picture: rails_blob_url(@property.picture)
    }
  end

  def get_endpoints
    @limit = if params[:limit]
               params[:limit].to_i
             else
               20
             end

    page = if params[:page]
             params[:page].to_i
           else
             1
           end

    @offset = (page - 1) * @limit
  end
end
