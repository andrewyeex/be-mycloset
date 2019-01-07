class ClothingsController < ApplicationController
  def show
  end
  def index
    clothing = Clothing.all
    msg     = 'loaded All clothing Data'
    status  = 'success'
    render json: responseJSON(status, msg, clothing), status: :ok
  end
  def create
    clothing = Clothing.new({
      name:          params['name'],
      color:         params['color'],
      brand:         params['brand'],
      image:         params['image'],
      note:          params['note'],
      clothing_type: params['clothing_type'],
      date_bought:   params['date_bought']
    })
    if clothing.save
    	status = 'success'
      msg    = 'created New Clothing'
      render json: responseJSON(status, msg, clothing), status: :ok
    else
    	status = 'fail'
    	msg    = 'failed to save clothing'
      render json: responseJSON(status, msg, clothing), status: :internal_server_error
    end
  end
  def type
    type     = params['type']
    msg      = "loaded #{type}"
    status   = 'success'
    clothing = Clothing.where(clothing_type: type)
    render json: responseJSON(status, msg, clothing), status: :ok
  end
  def update
    clothing             = Clothing.find(params['id'])
    clothing.name        = params['name']
    clothing.color       = params['color']
    clothing.image       = params['image']
    clothing.note        = params['note']
    clothing.brand       = params['brand']
    clothing.clothing_type = params['clothing_type']
    clothing.rating      = params['rating']
    clothing.is_favorite = params['is_favorite']
    if clothing.save
    	status = 'success'
    	msg    = 'succesfully updated clothing'
    	render json: responseJSON(status, msg, clothing), status: :ok
    else
    	status = 'fail'
    	msg    = 'failed Updating Clothing'
      render json: responseJSON(status, msg, clothing), status: :internal_server_error
    end
  end
  def isFavorite
    isFavorite = params['value']
    clothing   = Clothing.find(id: params['id'])
    clothing.is_favorite = !clothing.is_favorite
    if clothing.save
    	status = 'success'
    	msg    = 'successfully updated isFavorite'
    	render json: responseJSON(status, msg, clothing), status: :ok
    else
    	status = 'fail'
    	msg    = 'failed'
    	render json: responseJSON(status, msg, clothing), status: :internal_server_error
    end
  end

  # utils
  def responseJSON status, msg, data
    return {
      status: status,
      message: msg,
      data: data
    }
  end
end
