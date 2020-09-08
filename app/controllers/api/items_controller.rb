class Api::ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, methods: [:image_url]
    else
      render json: @item.errors, status: :bad_request
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :category, :color, :scene, :count, :purchased_at, :image
    )
  end
end
