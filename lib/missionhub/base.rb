module MissionHub
  class Base < ActiveResource::Base

    def self.connection(refresh = false)
      if defined?(@connection) || superclass == Object
        @connection = Connection.new(site, format) if refresh || @connection.nil?
        @connection.proxy = proxy if proxy
        @connection.auth_type = auth_type if auth_type
        @connection.timeout = timeout if timeout
        @connection
      else
        superclass.connection
      end
    end
  end

  class Connection < ActiveResource::Connection

    private

    def request(method, path, *arguments)
      result = ActiveSupport::Notifications.instrument("request.active_resource") do |payload|
        path = add_secret_to_path(path)
        payload[:method]      = method
        payload[:request_uri] = "#{site.scheme}://#{site.host}:#{site.port}#{path}"
        payload[:result]      = http.send(method, path, *arguments)
      end
      handle_response(result)
    rescue Timeout::Error => e
      raise TimeoutError.new(e.message)
    rescue OpenSSL::SSL::SSLError => e
      raise SSLError.new(e.message)
    end

    def add_secret_to_path(path)
      path += path.include?('?') ? '&' : '?'
      path + "secret=#{MissionHub.client_secret}"
    end
  end
end
