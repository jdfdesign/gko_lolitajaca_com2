Product.class_eval do

  has_many :print_assignments,
           :dependent => :destroy,
           :order => "print_assignments.position"
  has_many :prints,
           :through => :print_assignments
           
  has_option :sizes
end