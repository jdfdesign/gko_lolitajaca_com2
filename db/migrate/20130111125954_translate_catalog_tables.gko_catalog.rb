# This migration comes from gko_catalog (originally 20130107082600)
class TranslateCatalogTables < ActiveRecord::Migration
  def change 
    create_table :product_translations, :force => true  do |t|
      t.integer :product_id, :null => false
      t.string :locale, :null => false
      t.string :title
      t.text :body
      t.string :meta_title
      t.string :meta_description
      t.string :slug
      t.timestamps
    end
    add_index :product_translations, [:product_id, :locale], :name => "index_product_translations_on_product_and_locale"
  
    create_table :option_value_translations, :force => true  do |t|
      t.integer :option_value_id, :null => false
      t.string :locale, :null => false
      t.string  :presentation
      t.timestamps
    end
    add_index :option_value_translations, [:option_value_id, :locale], :name => "index_option_value_translations_on_option_value_and_locale"
  
    create_table :property_translations, :force => true  do |t|
      t.integer :property_id, :null => false
      t.string :locale, :null => false
      t.string :presentation, :null => false
      t.timestamps
    end
    add_index :property_translations, [:property_id, :locale], :name => "index_property_translations_on_property_and_locale"
  end
end