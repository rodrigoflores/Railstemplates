class RenameColumnGistFileToSourceUrlOnTemplates < ActiveRecord::Migration
  def self.up
    rename_column :templates, :gist_file, :source_url
  end

  def self.down
    rename_column :templates, :source_url, :gist_file
  end
end
