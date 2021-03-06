class User < ActiveRecord::Base
   has_secure_password
   validates :email, presence: :true, uniqueness: :true
   validates :password, presence: :true, confirmation: :true
   validates_confirmation_of :password

  has_many :walks
  has_many :dogs, through: :walks # Walk = "user_dog"

  has_many :owner_walks
  has_many :owners, through: :owner_walks

  def name
    if self.last_name
      "#{self.first_name} #{self.last_name}"
    else
      self.first_name
    end
  end
end
