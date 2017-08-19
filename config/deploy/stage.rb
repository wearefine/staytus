# configurable settings

set :server_name, 'fine18-devstage.afineserver.com'
set :server_port, '8022'

set :gemset, 'staging-staytus'
set :deploy_to, '/var/www/rails/staytus/staging'

# update settings below only if you need to
###########################################

server fetch(:server_name),
  user: fetch(:deploy_user),
  roles: %w{web app db assets},
  port: fetch(:server_port),
  ssh_options: {
    forward_agent: true
  }

set :stage, :stage
set :rails_env, 'stage'
set :branch, 'stage'

set :rvm_ruby_version, "#{fetch(:ruby_version)}@#{fetch(:gemset)}"

set :default_env, {
  path: "/usr/local/rvm/gems/#{fetch(:rvm_ruby_version)}/bin:/usr/local/rvm/rubies/#{fetch(:ruby_version)}/bin:$PATH",
  ruby_version: fetch(:ruby_version),
  gem_home: "/usr/local/rvm/gems/#{fetch(:rvm_ruby_version)}",
  gem_path: "/usr/local/rvm/gems/#{fetch(:rvm_ruby_version)}",
  bundle_path: "/usr/local/rvm/gems/#{fetch(:rvm_ruby_version)}/bin"  # If you are using bundler.
}
