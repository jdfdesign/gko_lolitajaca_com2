class Fabric < ActiveRecord::Base
  
  include Extensions::Models::Translatable
  
  translates :presentation
  attr_accessible :name, :presentation
  
  class Translation
    attr_accessible :locale
  end
  
  belongs_to :site, :touch => true
  belongs_to :product, :touch => true
  has_many :prints, :dependent => :destroy

end