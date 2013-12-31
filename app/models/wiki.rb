class Wiki < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title
  validates :title, presence: true
  validates :body, presence: true
end
