class Wiki < ActiveRecord::Base
  has_and_belongs_to_many :users
  attr_accessible :body, :title, :public, :user_ids
  validates :title, presence: true
  validates :body, presence: true

  default_scope order('created_at DESC')

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end

end
