class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  #accepts_nested_attributes_for :user
  def user_attributes=(ua)
    self.user = User.find_or_create_by(username: ua[:username]) unless ua[:username].blank?
  end
end
