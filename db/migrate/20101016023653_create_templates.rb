class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
      t.string :title
      t.string :description
      t.string :gist_file
      t.references :githubber

      t.timestamps
    end
  end

  def self.down
    drop_table :templates
  end
end
