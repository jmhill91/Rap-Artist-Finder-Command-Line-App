class Subgenre < ActiveRecord::Base
  belongs_to :song
  has_many :features 
  has_many :rappers, through: :features

end
