#!/usr/bin/env ruby
require File.expand_path('../../../config/environment.rb', __FILE__)

#require 'rbrainz'
#require 'ruby-debug'
include MusicBrainz

query  = Webservice::Query.new

# When we find release groups by querying Artist, we could not obtain extra
# information about the release group, such as release date. Thus, 
Album.find_each do |album|
  #Skip record if already processed
  next if album.release_date

  rg = query.get_release_group_by_id(album.mbid, :releases => true)
  # Let's just pick out the first release, and get that release information.
  # We can also get track information by settings :tracks = true.
  r = query.get_release_by_id(rg.releases[0].id.uuid, :release_events => true, 
                             :counts => true, :tracks => true)
  
  #rg.earliest_release_date returns an IncompleteDate (which is like a range).
  #So we get the first part of it.
  begin
    album.release_date = r.earliest_release_date.first
    album.save
  rescue NoMethodError
    #Means that the album does not have a release date.
    print 'x'
  end

  # We assume that the tracks are in the correct numerical order.
  r.tracks.each_with_index do |track, i|
    t = album.tracks.find_or_create_by_title(track.title)
    t.update_attributes(:position => i+1) #start track at #1
  end

  sleep 1 #sec, for throttling
  print '.'
end
