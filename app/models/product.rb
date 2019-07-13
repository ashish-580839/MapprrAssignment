class Product < ApplicationRecord

  acts_as_taggable
  acts_as_taggable_on :categories, :tags
  # ASSUMPTIONS
  # multiword categories and tags would be separated by minus(-) only, no special characers allowed

  validates :name, :sku_id, :expire_date, :price,  presence: true
  validates :name, allow_blank: true, length: { minimum: 2, maximum: 200 }

  validates :price, numericality: { greater_than: 0  }

  validates :sku_id, allow_blank: true, numericality: { greater_than: 0 }

  validates :sku_id, allow_blank: true, uniqueness: true

  # ASSUMPTIONS
  # Expire date validations are missing

  serialize :images, Array

  def self.create_or_update(params)
    product = Product.find_or_initialize_by(sku_id: params[:sku_id])
    product.assign_attributes(params)
    product.save
    return product
  end

end
