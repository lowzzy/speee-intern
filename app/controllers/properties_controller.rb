# frozen_string_literal: true

class PropertiesController < ApplicationController
  def new
    @property = Property.new
    prefectures_list
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      flash[:info] = '登録が完了しました'
      # ここにapiの処理を書きたい
      retry_on_error { nearly }
      render :price
    else
      flash[:info] = "入力に誤りが含まれています : #{@property.errors.full_messages.join('. ')}"
      redirect_to new_property_path
    end
  end

  def price; end

  private

  def nearly
    return unless property_params[:prefecture]

    # rubocop:disable all
    uri = URI.parse("https://www.land.mlit.go.jp/webland/api/TradeListSearch?from=#{Date.today.year - 1}#{Date.today.month}&to=#{Date.today.year}#{Date.today.month}&area=#{property_params[:prefecture]}&city=#{property_params[:city]}")
    # rubocop:enable all
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.open_timeout = 5 # responseが最初に帰ってくるまでの時間
      http.read_timeout = 10 # ページを実際に返してくれるまでの時間
      http.get(uri.request_uri)
    end
    result = JSON.parse(response.body)

    raise 'EmptyError' unless result['data'].present?

    @nearly = result['data']
  end

  def retry_on_error(times: 3)
    try = 0
    begin
      try += 1
      yield
    rescue StandardError
      retry if try < times
      false
    end
  end

  def property_params
    params.require(:property)
          .permit(:prefecture, :city,
                  :age, :kinds, :address,
                  :square_measure, :floor_plan)
  end

  def prefectures_list
    @prefectures_list = Prefecture.all.pluck(:name, :id)
  end
end
