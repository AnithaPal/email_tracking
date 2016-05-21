module EmailTracker
  class Rack
    def initialize(app)
      @app = app
    end

    def call(env)
      req = ::Rack::Request.new(env)

      if req.path =~ /^\/email\/track\/(.+).png/
        details = Base64.decode64(Regexp.last_match[1])
        email = nil

        details.split('&').each do |kv|
          key, value = kv.split('=')

          if key == 'email'
            email = value
          end

        end

        if email
          SentOpenedEmail.create!({
            email: email,
            ip_address: req.ip,
            opened: DateTime.now
          })
        end

       [ 200, { 'Content-Type' => 'image/png' }, [ File.read(File.join(File.dirname(__FILE__), 'track.png')) ] ]
     else
       @app.call(env)
     end
    end
  end
end
