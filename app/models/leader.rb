class Leader < ActiveRecord::Base

  validates :score, presence: true
end
