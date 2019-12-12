class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    #get '/items/Figs'
    #get '/items/Apples'

    if req.path.start_with? "/items"
      item = req.path.split("/").last
      @@items.detect { |i| i.name == item }
      resp.write "You requested the songs"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
