class AddDownloadCounterToTemplates < ActiveRecord::Migration
  def self.up
    add_column :templates, :download_counter, :integer, :default => 0
  end

  def self.down
    remove_column :templates, :download_counter
  end
end
