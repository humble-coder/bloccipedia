class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  has_many :wikis
  validates :name, presence: true
  before_create :set_user

  def has_free_account?
    self.role == 'Free'
  end

  def has_premium_account?
    self.role == 'Premium'
  end

  private
  
  def set_user
    self.role = 'Free'
  end

end
