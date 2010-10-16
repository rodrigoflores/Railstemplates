# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :githubber do |f|
  f.name "Wylkon wylson"
  f.sequence(:github_token) { |n| "dnasldfnsaljdfndljfndljasfbnljagbfs#{n}" }
  f.login "wylkon"
end
