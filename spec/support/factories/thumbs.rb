# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :thumb do |f|
  f.up true
  f.template  {   |x| x.association :template }
  
end
