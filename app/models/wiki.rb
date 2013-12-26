class Wiki < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :users
  belongs_to :user
end
