# This migration comes from gko_catalog (originally 20130114134500)
class AddOptionsToProducts < ActiveRecord::Migration
  def change 
    add_column :products, :options, :text
  end
end