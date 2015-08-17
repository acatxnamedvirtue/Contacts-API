require 'addressable/uri'
require 'rest-client'

def all_users
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users'
  ).to_s

  puts RestClient.get(
    url
  )
end

def find_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2'
  ).to_s

  puts RestClient.get(
    url,
    id:2
  )
end

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts'
  ).to_s

  begin
    puts RestClient.post(
      url,
      { contact: { name: "Gizmo", user_id: 1, email: "gizmo@gizmo.gizmo" } }
    )
  rescue RestClient::Exception => e
    puts e.message
  end
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3'
  ).to_s

  puts RestClient.put(
    url,
    {id: 3, user: { name: " " , email: "gizmo@gizmo.gizmo"} }
  )
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3'
  ).to_s

  puts RestClient.delete(
    url,
    {id: 3}
  )
end
