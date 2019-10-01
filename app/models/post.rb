class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(cat_attribs)
    cat_attribs.values.each do |category_attrib|
      category = Category.find_or_create_by(category_attrib)
      self.categories << category
    end
  end
end
