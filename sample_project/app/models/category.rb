class Category < ApplicationRecord
  has_ancestry

  attr_accessor :parent_id

end
