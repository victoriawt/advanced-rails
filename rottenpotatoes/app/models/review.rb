class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :moviegoer
  attr_protected :moviegoer_id # see text
  validates :movie, :presence => true
end
