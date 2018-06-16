json.id category.id
json.text "#{category.favorite_order} #{category.title}"
json.parent category.root? ? "#" : category.ancestry.split("/").last
json.order category.favorite_order