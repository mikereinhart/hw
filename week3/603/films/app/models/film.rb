class Film < ActiveRecord::Base
  attr_accessible :description, :director, :title, :writer
end
