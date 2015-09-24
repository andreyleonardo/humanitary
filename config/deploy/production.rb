set :stage, :production
server '40.122.120.171', user: 'deploy', roles: %w{web app db}