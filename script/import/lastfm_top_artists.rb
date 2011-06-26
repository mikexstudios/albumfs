#!/usr/bin/env ruby
require File.expand_path('../../../config/environment.rb', __FILE__)

require 'open-uri'
require 'nokogiri'
#require 'ruby-debug'

API_CALL = 'http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=%s&limit=10'

doc = Nokogiri::XML(open(API_CALL % Rails.configuration.lastfm.apikey))

doc.xpath('//artist').each do |artist|
  name = artist.at_css('name').text
  mbid = artist.at_css('mbid').text

  #Print out name and musicbrainz id
  puts '%s, %s' % [name, mbid]
  
  #Also populate database with it. If the Artist already exists, then don't create
  #it again.
  Artist.find_or_create_by_name(:name => name, :mbid => mbid)
end
