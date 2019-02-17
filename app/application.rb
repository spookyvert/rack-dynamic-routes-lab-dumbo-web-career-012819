class Application
 
  @@items = [Item.new("Grape", 0.99),
            Item.new("Apple",1.00)]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/songs/)
 
      item_name = req.path.split("/items/").last 
      if item = @@items.find{|i| i.title == item_name
      }
 
      resp.write item.price
    elsif resp.status == 404
      resp.write "Route not found"
    end
 
    resp.finish
  end
end