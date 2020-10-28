class Api::ItemsController < ApplicationController
  before_action :authenticate!
  before_action :set_item, only: %i[show destroy]

  def index
    @items = current_user.items.all
    render json: @items, methods: [:image_url]
  end

  def delete_list
    @delete_list_items = current_user.items.all - current_user.items.wearing.one_month_ago
    render json: @delete_list_items, methods: [:image_url]
  end

  def show
    render json: @item, methods: [:image_url]
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      render json: @item, methods: [:image_url]
    else
      render json: @item.errors, status: :bad_request
    end
  end

  def update
    item = Item.find(params[:item][:id])

    if item.update(item_params)
      render json: item, methods: [:image_url]
    else
      render json: item.errors, status: :bad_request
    end
  end

  def destroy
    @item.destroy!
    render json: @item
  end

  private

  def set_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name, :category, :color, :scene, :purchased_at, :image
    )
  end
end
