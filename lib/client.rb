require 'oauth2'
require 'pp'

client_id     = '866a865a75ea95d2d082a392c417ff5c5cca2462f3d3d1824d07296388d0331c' # your client's id generated with rake db:setup
client_secret = '79f4ba9d85598d2197cd3809c0cbdf77c0ee517bc9d2802d02a5854b86eb1d9a' # your client's secret
redirect_uri  = 'urn:ietf:wg:oauth:2.0:oob' # your client's redirect uri
site          = "http://localhost:3000" # your provider server, mine is running on localhost

client = OAuth2::Client.new(client_id, client_secret, :site => site)
# pp client.auth_code.authorize_url(:redirect_uri => redirect_uri)


code = "32a7dd406dd4a4688589e79071bbbcc836b3c0a50cb60ad483147c4dbe80e859" # code you got in the redirect uri
token = client.auth_code.get_token(code, :redirect_uri => redirect_uri)
response = token.get('/api/v1/people.json')
pp JSON.parse(response.body)
