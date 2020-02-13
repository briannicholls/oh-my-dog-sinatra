class Walk < ActiveRecord::Base

  belongs_to :dog
  belongs_to :user # as walker??

  validates_presence_of :window_start
  validates_presence_of :window_end

end
