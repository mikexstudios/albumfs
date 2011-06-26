class Artist < ActiveRecord::Base
  attr_accessible :name, :mbid

  has_many :albums
end


# == Schema Information
#
# Table name: artists
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  mbid       :string(255)
#

