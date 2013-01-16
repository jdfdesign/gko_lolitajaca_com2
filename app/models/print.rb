class Print < ActiveRecord::Base
  
  include Extensions::Models::Translatable
  
  translates :presentation
  attr_accessible :name, :presentation
  
  class Translation
    attr_accessible :locale
  end

  include Extensions::Models::HasManyImageAssignments

  belongs_to :fabric, :touch => true
  has_many :print_assignments,
           :dependent => :destroy,
           :order => "print_assignments.position"

end