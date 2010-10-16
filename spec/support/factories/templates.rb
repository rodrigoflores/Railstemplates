# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :template do |f|
  f.gist_file "MyString"
  f.githubber { |x| x.association :githubber }
end
