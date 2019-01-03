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
    data     = JSON.parse(request.raw_post)
    clothing = Clothing.new({
      name:          data['name'],
      image:         data['image'],
      note:          data['note'],
      clothing_type: data['type'],
      date_bought:   data['date_bought']
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
  	data = JSON.parse(request.raw_post)
    clothing             = Clothing.find(id: data['id'])
    clothing.name        = data['name']
    clothing.note        = data['note']
    clothing.brand       = data['brand']
    clothing.rating      = data['rating']
    clothing.is_favorite = data['is_favorite']
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
