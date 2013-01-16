class PrintAssignment < ActiveRecord::Base

  attr_accessible :name, :presentation, :position

  belongs_to :print, :touch => true
  belongs_to :product, :touch => true

  default_scope :order => 'print_assignments.position'
  acts_as_list :scope => :product_id
  validates_presence_of :product_id, :print_id
  delegate :presentation, :thumbnail, :to => :print, :prefix => false
  
end