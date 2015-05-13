map "/" do
  run Rack::File.new("dist/index.html")
end
