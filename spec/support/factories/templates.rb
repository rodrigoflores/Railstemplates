# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :template do |f|
  f.gist_file "http://gist.github.com/496469"
  f.sequence(:title) { |n| "wylkon wylson#{n}" }
end
