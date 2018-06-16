module CategoriesHelper
  def indent(path)
    path ||= ""
    size = path.split("/").size
    raw("&nbsp;&nbsp;&nbsp;"*size)
    # raw("&nbsp;&nbsp;&nbsp;"*size + (size > 0 ? "┗" : ''))
  end
end
