class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  has_and_belongs_to_many :wikis
  # attr_accessible :title, :body
  validates :name, presence: true
  after_create :set_user

  private
  
  def set_user
    self.premium = false
  end

end
