#!/usr/bin/env ruby
require File.expand_path('../../../config/environment.rb', __FILE__)

#require 'rbrainz'
#require 'ruby-debug'
include MusicBrainz

query  = Webservice::Query.new

# With the ArtistInclude object we can control what
# kind of information the MusicBrainz server will
# include in its answer.
artist_includes = Webservice::ArtistIncludes.new(
  :aliases      => true,
  :release_groups => true,
  :releases     => ['Album', 'Official'],
  :artist_rels  => true,
  :release_rels => true,
  :track_rels   => true,
  :label_rels   => true,
  :url_rels     => true
)

Artist.find_each do |artist|
  data = query.get_artist_by_id(artist.mbid, artist_includes)

  #NOTE: The release groups may sometimes contain various versions of the album
  #(like deluxe versions, etc.) so it's not extremely accurate.
  data.release_groups.each do |rg|
    #We can't seem to add extra information to find_or_create when going through
    #association. We update after querying.
    album = artist.albums.find_or_create_by_title(rg.title)
    album.update_attributes(:mbid => rg.id.uuid)

    #NOTE: We need to query each release group separately and grab the release
    #date. Then pick one of the releases (figure out a consistent way of doing
    #this) and get the tracks for those releases.
  end

  sleep 1 #sec, throttle API
end
