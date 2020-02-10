class Owner < ActiveRecord::Base
  has_many :dogs

  has_many :walks, through: :dogs

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
