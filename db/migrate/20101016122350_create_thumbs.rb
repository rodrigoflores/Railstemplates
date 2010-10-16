class CreateThumbs < ActiveRecord::Migration
  def self.up
    create_table :thumbs do |t|
      t.boolean :up 
      t.integer :template_id
      t.integer :githubber_id
      t.timestamps
    end
  end

  def self.down
    drop_table :thumbs
  end
end
