class OutfitsController < ApplicationController
  def show
  end
  def index
    data = Outfit.all
    msg = 'Loaded All Outfits'
    render json: successJSON(msg, data), status: :ok
  end
  def create
  end
  def update
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
