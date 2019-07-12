class Api::V1::ProductsController < ApplicationController

  def create
    @product = Product.create_or_update(product_params)
    if @product.valid?
      render json: @product, status: :ok
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def product_params
    params.permit(:expire_date, :name, :sku_id, :price, category_list: [], tag_list:[], images: [:img_path] )
  end
end
