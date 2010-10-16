class DeviseCreateGithubbers < ActiveRecord::Migration
  def self.up
    create_table(:githubbers) do |t|
      t.database_authenticatable :null => false
      t.string :name
      t.string :github_token
      t.trackable
      t.timestamps
    end

    add_index :githubbers, :email,                :unique => true
  end

  def self.down
    drop_table :githubbers
  end
end
