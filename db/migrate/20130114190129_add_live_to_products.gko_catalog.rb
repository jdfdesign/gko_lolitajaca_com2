# This migration comes from gko_catalog (originally 20130114145800)
class AddLiveToProducts < ActiveRecord::Migration
  def change 
    add_column :products, :live, :boolean, :default => true
    add_index :products, [:section_id, :live], :name => "index_products_on_section_and_live"
  end
end