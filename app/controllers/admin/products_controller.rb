class Admin::ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :show, :update]

  def index
    @products = Product.includes(:categories, :tags).all
  end

  def edit
  end

  def show
    render json: @product, status: :ok
  end

  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.permit(:expire_date, :name, :sku_id, :price, category_list: [], tag_list:[] )
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
