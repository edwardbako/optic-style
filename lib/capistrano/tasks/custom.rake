desc 'Seed database with rake'
task :seed do
  puts "\n=== Seeding Database ===\n"
  on primary :db do
    within current_path do
      with rails_env: fetch(:stage) do
        execute :rake, 'db:seed'
      end
    end
  end
end

desc 'tail production log files'
task :tail_logs do
  set :log_name, ask('Enter the log name:')
  on roles(:app) do
    execute "tail -f #{current_path}/log/#{fetch(:log_name)}.log"
  end
end
