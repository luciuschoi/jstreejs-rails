class Category < ApplicationRecord
  has_ancestry

  attr_accessor :parent_id

  default_scope { order('favorite_order, title collate "C"')}

  def self.transfer(transfer_ids, target_id)
    transfer_nodes = Category.find(transfer_ids.split(","))
    target_node = target_id == 'root' ? nil : Category.find(target_id)
    transfer_nodes.each do |category|
      category.update_attribute :parent, target_node
    end
  end    
end
