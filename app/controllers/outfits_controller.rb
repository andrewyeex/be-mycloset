class OutfitsController < ApplicationController
  def show
  end
  def index
    outfit   = Outfit.all
    msg      = 'Loaded All Outfits'
    status   = 'success'
    render json: responseJSON(status, msg, outfit), status: :ok
  end
  def create
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
