require 'rake'
require 'dotenv'

def build_and_deploy
  system("bundle exec middleman build")
end

namespace :build do
  desc 'Build Staging'
  task :staging do
    Dotenv.load '.env.staging'
    system('bundle exec middleman build')
  end

  task :production do
    Dotenv.load '.env.production'
    system('bundle exec middleman build')
  end
end

namespace :deploy do
  desc 'Deploy to production'
  task :production do
    Dotenv.load '.env.production'
    build_and_deploy
  end

  desc 'Deploy to staging'
  task :staging do
    Dotenv.load '.env.staging'
    build_and_deploy
  end

end

