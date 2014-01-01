class Wiki < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title
  validates :title, presence: true
  validates :body, presence: true
  after_create :set_type

  private

  def set_type
    self.update_attribute(:public, true)
  end

end
