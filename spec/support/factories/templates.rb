# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :template do |f|
  f.gist_file "http://github.com/sabbre/base-template/blob/master/template.rb"
  f.sequence(:title) { |n| "wylkon wylson#{n}" }
end
