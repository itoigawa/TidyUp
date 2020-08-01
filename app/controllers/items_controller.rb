class ItemsController < ApplicationController
  def index; end

  def new; end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item
    else
      render json: @item.errors, status: :bad_request
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
