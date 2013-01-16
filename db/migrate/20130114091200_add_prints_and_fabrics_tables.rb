class AddPrintsAndFabricsTables < ActiveRecord::Migration
  def change 
    create_table :fabrics, :force => true  do |t|
      t.integer :site_id, :null => false
      t.string :name
      t.string :presentation
      t.timestamps
    end
    add_index :fabrics, :site_id

    create_table :fabric_translations, :force => true  do |t|
      t.integer :fabric_id, :null => false
      t.string :locale, :null => false
      t.string  :presentation
      t.timestamps
    end
    add_index :fabric_translations, [:fabric_id, :locale], :name => "index_fabric_translations_on_presentation_and_locale"
    
    create_table :prints, :force => true  do |t|
      t.integer :fabric_id, :null => false
      t.string :name
      t.string :presentation
      t.timestamps
    end
    add_index :prints, :fabric_id

    create_table :print_translations, :force => true  do |t|
      t.integer :print_id, :null => false
      t.string :locale, :null => false
      t.string  :presentation
      t.timestamps
    end
    add_index :print_translations, [:print_id, :locale], :name => "index_print_translations_on_presentation_and_locale"
    
    create_table :print_assignments, :force => true  do |t|
      t.integer :print_id, :null => false
      t.integer :product_id, :null => false
      t.integer :position, :default => 0, :null => false
      t.decimal :price, :precision => 8, :scale => 2
      t.timestamps
    end
    add_index :print_assignments, [:product_id, :print_id], :name => "index_print_assignments_on_product_and_print"
  end
end