template = 'rails3'
application = 'rails_templates'
repository = 'git@github.com:railsrumble/rr10-team-108.git'
hosts = %w(railstemplates)

before_restarting_server do
  run "jammit"
end

ssh_opts = '-A'

user = 'deploy'