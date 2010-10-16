class GithubberEmailFix < ActiveRecord::Migration
  def self.up
    change_column :githubbers, :email, :string, :null => true
  end

  def self.down
    change_column :githubbers, :email, :string
  end
end