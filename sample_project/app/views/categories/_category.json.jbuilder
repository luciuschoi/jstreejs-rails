json.id category.id
json.text category.title
json.parent category.root? ? "#" : category.ancestry.split("/").last