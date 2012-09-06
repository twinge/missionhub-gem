Dir[File.dirname(__FILE__) + '/missionhub/*.rb'].each do |file|
  require file
end

module MissionHub
  extend self

  attr_accessor :client_id, :client_secret, :base_uri

  # And we define a wrapper for the configuration block, that we'll use to set up
  # our set of options
  def config(&block)
    instance_eval(&block)
  end
end
