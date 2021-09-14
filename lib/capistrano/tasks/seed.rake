namespace :deploy do
  desc "reload the database with seed data"
  task :semilla do
      on roles(:all) do
          within current_path do # Sino utilizar el release_path para la versión actual
              execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=production'
          end
      end
  end
end

after "deploy:symlink:release", "semilla"

# namespace :deploy do
#     desc "reload the database with seed data"
#     task :seed do
#       on roles(:all) do
#         within current_path do
#           execute :bundle, :exec, "rails", "db:seed", "RAILS_ENV=production"
#         end
#       end
#     end
#   end

  #after "deploy:migrate", "seed"
