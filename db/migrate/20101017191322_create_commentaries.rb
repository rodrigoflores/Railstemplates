class CreateCommentaries < ActiveRecord::Migration
  def self.up
    create_table :commentaries do |t|
      t.text :commentary
      t.integer :githubber_id
      t.integer :template_id
      t.timestamps
    end
  end

  def self.down
    drop_table :commentaries
  end
end
