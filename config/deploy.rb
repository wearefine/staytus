# configurable settings

set :application, 'staytus'
set :repo_url, 'git@github.com:wearefine/staytus.git'
set :ruby_version, 'ruby-2.3.3'
set :deploy_user, 'staytus'

# update settings below only if you need to
###########################################

set :bundle_path, -> {}
set :bundle_flags, '--quiet --system'

set :passenger_rvm_ruby_version, 'ruby-2.3.0'

set :assets_roles, [:assets]
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system public/assets}
set :rvm_type, :system
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, shared_path.join('restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup', 'newrelic:notice_deployment'

end
