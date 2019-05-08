class Feature < ActiveRecord::Base
  belongs_to :song
  belongs_to :rapper
end
