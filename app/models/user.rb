class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates :username, :uniqueness => { :case_sensitive => false }, length: {minimum: 6, maximum: 20}
  validates :email, :uniqueness => { :case_sensitive => false }
  
  has_and_belongs_to_many :beers
  has_many :comments
  has_many :followers,  class_name: 'Followings', foreign_key: 'user_id',     conditions: "blocked = false"
  has_many :followings, class_name: 'Followings', foreign_key: 'follower_id', conditions: "blocked = false"
  has_many :blockings,  class_name: 'Followings',  foreign_key: 'user_id', conditions: "blocked = true"



  def self.search_for(query)
    @users = User.where("LOWER(username) LIKE LOWER(:query) OR LOWER(email) LIKE LOWER(:query)", query: "%#{query}%").order(username: :asc)
  end


#Username or email login
#-----------------------
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
  
  def self.find_first_by_auth_conditions(warden_conditions)
   conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
#-----------------------
end
