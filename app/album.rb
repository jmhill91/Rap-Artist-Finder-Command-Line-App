class Album < ActiveRecord::Base
  belongs_to :rapper
  has_many :features
  has_many :songs, through: :features
end
