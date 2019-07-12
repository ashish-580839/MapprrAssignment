
class Admin::ProductSerializer < ActiveModel::Serializer
  attributes :name, :sku_id, :price, :images, :category_list, :tag_list

end
