class Dog < ActiveRecord::Base
  belongs_to :owner

  has_many :walks
  has_many :users, through: :walks

end
