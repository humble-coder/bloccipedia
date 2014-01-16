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

  def is_wiki_owner?(wiki)
    self.wikis.include?(wiki) && self.premium
  end

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end

  private
  
  def set_user
    self.premium = false
  end

end
