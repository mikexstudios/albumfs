class Album < ActiveRecord::Base
  attr_accessible :title, :release_date, :mbid

  belongs_to :artist
  has_one :album_art
  has_many :sources
  has_many :tracks

  #WARNING: :build_album_art must ALWAYS validate or else will receive weird error
  #message and album_art dependency will not be created.
  before_create :build_album_art

  include Tanker
  tankit 'albumfs' do
    indexes :title
    indexes :artist_name do artist.name end
    indexes :track_names do
      tracks.map { |track| track.title }
    end
  end
  # Callbacks to update/delete the index whenever ORM is updated
  after_save :update_tank_indexes
  after_destroy :delete_tank_indexes

end



# == Schema Information
#
# Table name: albums
#
#  id           :integer         not null, primary key
#  artist_id    :integer
#  title        :string(255)
#  release_date :date
#  created_at   :datetime
#  updated_at   :datetime
#  mbid         :string(255)
#

