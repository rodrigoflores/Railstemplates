# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :template do |f|
  f.source_url "http://github.com/sabbre/base-template/raw/master/template.rb"
  f.sequence(:title) { |n| "wylkon wylson#{n}" }
end
