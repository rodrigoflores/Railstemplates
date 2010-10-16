class AddLoginToGithubbers < ActiveRecord::Migration
  def self.up
    add_column :githubbers, :login, :string
  end

  def self.down
    remove_column :githubbers, :login
  end
end
