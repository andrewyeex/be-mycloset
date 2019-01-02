class ClothingsController < ApplicationController
	def show
	end
  def index
    clothes = Clothing.all
    render json: { status: 'SUCCESS', message: 'Loaded All Clothes Data', data: clothes }, status: :ok
  end
  def create
    information = request.raw_post
    data_parsed = JSON.parse(information)
    clothes = Clothing.new({
      name: data_parsed['name'],
      image: data_parsed['image'],
      note: data_parsed['note'],
      clothing_type: data_parsed['type'],
      date_bought: data_parsed['date_bought']
    })
    if clothes.save
      render json: { status: 'SUCCESS', message: 'Created New Clothing', data: clothes }, status: :ok
    else
      render json: { status: 'FAIL', message: 'Failed Creating New Clothing', data: clothes }, status: :internal_server_error
		end
  end
  def type
    type = params['type']
    clothes = Clothing.where(clothing_type: type)
    render json: { status: 'SUCCESS', message: "Loaded #{type}", data: clothes }, status: :ok
  end
end
