require File.dirname(__FILE__) + '/missionhub/base.rb'

Dir[File.dirname(__FILE__) + '/missionhub/*.rb'].each do |file|
  require file
end

module MissionHub
  class << self
    attr_accessor :client_id, :client_secret, :site

    # And we define a wrapper for the configuration block, that we'll use to set up
    # our set of options
    def config
      yield self

      self.site ||= "https://www.missionhub.com/apis/v3"
      Base.site = site
    end
  end
end
