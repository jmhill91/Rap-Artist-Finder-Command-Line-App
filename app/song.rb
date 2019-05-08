class Song < ActiveRecord::Base
  has_many :features
  has_many :rappers, through: :features

end
