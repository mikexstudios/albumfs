#!/usr/bin/env ruby
require File.expand_path('../../../config/environment.rb', __FILE__)

#require 'ruby-debug'

Rockstar.lastfm = {'api_key' => Rails.configuration.lastfm.apikey, 
                   'api_secret' => Rails.configuration.lastfm.secret}

# For each album, query last.fm. Then write the cover art sizes to the album_art
# model.
# NOTE: We assume that each album already has the has_one album_art dependency
# created!
Album.find_each do |album|
  a = Rockstar::Album.new(album.artist.name, album.title, :include_info => true)

  #If the album as now found, we will skip adding album art.
  if a.mbid.nil?
    puts 'Could not find: %s - %s' % [album.artist.name, album.title]
    next
  end

  a.images.each do |key, value|
    begin
      album.album_art.send("#{key}=".to_sym, value)
    rescue NoMethodError
      puts 'Missing method: %s' % key
    end
  end

  album.album_art.save
  print '.'
  sleep 2 #s
end
