class Source < ActiveRecord::Base
end

# == Schema Information
#
# Table name: sources
#
#  id         :integer         not null, primary key
#  album_id   :integer
#  type       :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

