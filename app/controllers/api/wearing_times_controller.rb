class Api::WearingTimesController < ApplicationController
  before_action :authenticate!
  before_action :set_item, only: %i[create]

  def index
    render json: WearingTime.filter_by_item(params[:item_id]).select(:id, :user_id, :item_id)
  end

  def create
    WearingTime.transaction do
      wearing_time = current_user.wearing_times.find_or_create_by!(item_id: @item.id)

      if wearing_time.increment!(:count)
        render json: wearing_time
      else
        render json: wearing_time.errors, status: :bad_request
      end

    end
  end

  private

  def set_item
    @item = current_user.items.find(params[:id])
  end
end
