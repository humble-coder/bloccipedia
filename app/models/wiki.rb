class Wiki < ActiveRecord::Base
  attr_accessible :body, :title
  has_and_belongs_to_many :users
end


