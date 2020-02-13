class Dog < ActiveRecord::Base
  belongs_to :owner

  has_many :walks
  has_many :users, through: :walks

  def birthdate
      self.birthday.strftime('%Y-%m-%d')
  end

end
