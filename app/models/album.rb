class Album < ActiveRecord::Base
  attr_accessible :name, :release_date, :mbid

  belongs_to :artist
  has_many :sources
  has_many :tracks
end


# == Schema Information
#
# Table name: albums
#
#  id           :integer         not null, primary key
#  artist_id    :integer
#  name         :string(255)
#  release_date :date
#  created_at   :datetime
#  updated_at   :datetime
#  mbid         :string(255)
#

