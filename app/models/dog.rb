class Dog < ActiveRecord::Base
  belongs_to :owner

  has_many :walks
  has_many :users, through: :walks

  def birthdate
    if self.birthday.respond_to?('strftime')
      self.birthday.strftime('%Y-%m-%d')
    else
      self.birthday
    end
  end

end
