class Moviegoer < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :reviews
  has_many :movies, :through => :reviews

  def self.create_with_omniauth(auth)
    Moviegoer.create!(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"])
  end
# place a copy of the following line anywhere inside the Movie class
#  AND inside the Moviegoer class (idiomatically, it should go right
#  after 'class Movie' or 'class Moviegoer'):
  has_many :reviews

end

