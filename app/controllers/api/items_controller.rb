class Api::ItemsController < ApplicationController
  before_action :authenticate!
  def index
    @items = current_user.items.all
    render json: @items
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      render json: @item, methods: [:image_url]
    else
      render json: @item.errors, status: :bad_request
    end
  end

  def show
    @item = current_user.items.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :category, :color, :scene, :count, :purchased_at, :image
    )
  end
end
