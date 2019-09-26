class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories

  def category_attributes=(categories_hashes)
    categories_hashes.each do |i, cat_attrs|
      if cat_attrs[:name].present?
        category = Category.find_or_create_by(name: cat_attrs[:name])
        if !self.categories.include?(category)
          self.post_categories.build(:category => category)
        end
      end
    end
  end

  # def category_ids=(ids)
  #   ids.each do |id|
  #     category = Category.find_or_create_by(id: id)
  #     if category.name != "" && !self.categories.include?(category)
  #         self.post_categories.build(:category => category)
  #     end
  #   end
  # end

end
