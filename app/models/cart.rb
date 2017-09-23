class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  
  def add_item(course_id)
    course = Course.find(course_id)
    cart_items.find_or_create_by(course_id: course.id, sub_total: course.price)
    update_total
  end
  
  def remove_item(cart_item_id)
    item = cart_items.find(cart_item_id)
    item.destroy
    update_total
  end
  
  def update_total
    self.total = cart_items.sum(:sub_total)
    save
  end
end
