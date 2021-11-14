module ApplicationHelper
  def load_categories
    @categories = Category.sort_by_name.map{|category| [category.name, category.id]}
  end
  
  def load_total_book_month(book)
    # debugger
  end
end
