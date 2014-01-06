class Wiki < ActiveRecord::Base
  has_and_belongs_to_many :users
  attr_accessible :body, :title, :public, :user_ids
  validates :title, presence: true
  validates :body, presence: true

  default_scope order('created_at DESC')

end
