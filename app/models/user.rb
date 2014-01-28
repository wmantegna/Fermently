class User < ActiveRecord::Base
  has_and_belongs_to_many :beers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :username, :uniqueness => { :case_sensitive => false }#,
  #:format => { ... } # etc.
  # I THINK THIS IS WHERE THE ERROR IS

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

end
