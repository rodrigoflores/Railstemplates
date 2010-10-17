template = 'rails3'
application = 'rails3templates'
repository = 'git@github.com:railsrumble/rr10-team-108.git'
hosts = %w(railstemplates)

before_restarting_server do
  run "jammit"
  run "RAILS_ENV=production rake ts:reindex"
end

ssh_opts = '-A'

user = 'deploy'
path = '/home/deploy'

