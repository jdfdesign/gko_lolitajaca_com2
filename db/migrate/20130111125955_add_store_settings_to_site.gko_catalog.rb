# This migration comes from gko_catalog (originally 20130107111800)
class AddStoreSettingsToSite < ActiveRecord::Migration
  def change 
    add_column :sites, :store_settings, :text
  end
end