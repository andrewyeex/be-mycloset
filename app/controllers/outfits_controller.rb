class OutfitsController < ApplicationController
  def show
  end
  def index
    outfit = Outfit.all.map do |o|
      {
      	id: o.id, # number
        shoes: Clothing.where(id: o.shoes_id).first, # object
        bottom: Clothing.where(id: o.pants_id).first, # object
        top: o.tops.split(',').map { |top| Clothing.where(id: top).first }, # array
        headwear: Clothing.where(id: o.headwear_id).first, # object
        times_worn: o.times_worn # number
      }
    end
    msg      = 'Loaded All Outfits'
    status   = 'success'
    render json: responseJSON(status, msg, outfit), status: :ok
  end
  def create
    outfit = {
    	shoes_id: params['shoes'],
    	pants_id: params['bottom'],
    	tops: params['top'],
    	headwear_id: params['headwear']
    }
    o = Outfit.new(outfit)
    if o.save!
      status = 'success'
      msg    = 'created new outfit'
      render json: responseJSON(status, msg, o), status: :ok
    else
    	status = 'fail'
    	msg    = 'failed to save outfit'
      render json: responseJSON(status, msg, o), status: :internal_server_error
    end
  end
  def update
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
