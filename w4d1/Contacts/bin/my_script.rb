# bin/my_script.rb
require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.json'
).to_s

puts RestClient.get(url)


def create_user
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.json',
  ).to_s

  # puts RestClient.post(
  #   url,
  #   { user: { name: "Gizmo", email: "gizmo@gizmo.gizmo" } }
  # )
  #
  puts RestClient.post(
  url,
  { user: { name: "Gizmo" } }
)
end

create_user
