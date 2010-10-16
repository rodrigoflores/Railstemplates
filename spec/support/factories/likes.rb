# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :like do |f|
  f.githubber { |x| x.association :githubber }
  f.template { |x| x.association :template }
  
end
