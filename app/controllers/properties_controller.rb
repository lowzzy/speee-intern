# frozen_string_literal: true

class PropertiesController < ApplicationController
  def new
    prefectures_list
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:info] = '登録が完了しました'
      redirect_to price_property_url(@property.id)
    else
      flash[:info] = "入力に誤りが含まれています : #{@property.errors.full_messages.join('. ')}"
      redirect_to property_registration_path
    end
  end

  def price; end

  private

  def property_params
    params.require(:property)
          .permit(:age, :prefecture, :city, :station,
                  :floor_plan, :square_measure,
                  :construction_type, :material_type)
  end

  def prefectures_list
    @prefectures_list = Prefecture.all.pluck(:name, :id)
  end

  def city_list
    @cities_list = @prefecture.cities.pluck(:name, :id)
  end
end
