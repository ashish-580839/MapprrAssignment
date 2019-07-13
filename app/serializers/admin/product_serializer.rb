
class Admin::ProductSerializer < ActiveModel::Serializer
  attributes :name, :sku_id, :price, :expire_date, :images, :category_list, :tag_list

end
