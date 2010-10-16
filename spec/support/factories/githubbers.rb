# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :githubber do |f|
  f.name "Wylkon wylson"
  f.sequence(:email) { |n| "dnasldfnsaljdfndljfndljasfbnljagbfs#{n}@a.com" }
  f.login "wylkon"
end
