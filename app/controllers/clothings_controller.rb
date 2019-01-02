class ClothingsController < ApplicationController
	def show
	end
  def index
    clothes = Clothing.all
    msg = 'Loaded All Clothes Data'
    render json: successJSON(msg, clothes), status: :ok
  end
  def create
    d = JSON.parse(request.raw_post)
    clothes = Clothing.new({
      name: d['name'],
      image: d['image'],
      note: d['note'],
      clothing_type: d['type'],
      date_bought: d['date_bought']
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

  # utils
  def successJSON message, data
    return {
      status: 'SUCCESS',
      message: message,
      data: data
    }
  end
end
