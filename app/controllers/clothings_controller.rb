class ClothingsController < ApplicationController
  def show
  end
  def index
    clothes = Clothing.all
    msg = 'Loaded All Clothes Data'
    render json: successJSON(msg, clothes), status: :ok
  end
  def create
    data = JSON.parse(request.raw_post)
    clothes = Clothing.new({
      name: data['name'],
      image: data['image'],
      note: data['note'],
      clothing_type: data['type'],
      date_bought: data['date_bought']
    })
    if clothes.save
      msg = 'Created New Clothing'
      render json: successJSON(msg, clothes), status: :ok
    else
      render json: { status: 'FAIL', message: 'Failed Creating New Clothing', data: clothes }, status: :internal_server_error
    end
  end
  def type
    type = params['type']
    msg = "Loaded #{type}"
    clothes = Clothing.where(clothing_type: type)
    render json: successJSON(msg, clothes), status: :ok
  end
  def update
  	data = JSON.parse(request.raw_post)
    clothing = Clothing.find(id: data['id'])
    clothing.name = data['name']
    clothing.note = data['note']
    clothing.brand = data['brand']
    clothing.rating = data['rating']
    clothing.is_favorite = data['is_favorite']
    if clothing.save
    	msg = 'Succesfully updated clothing'
    	render json: successJSON(msg, clothing), status: :ok
    else
      render json: { status: 'FAIL', message: 'Failed Updating Clothing', data: clothing }, status: :internal_server_error
    end
  end

  # utils
  def successJSON message, data
    return {
      status: 'SUCCESS',
      message: message,
      data: data
    }
  end
end
