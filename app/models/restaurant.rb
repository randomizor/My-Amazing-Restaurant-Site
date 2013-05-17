class Restaurant < ActiveRecord::Base
  attr_accessible :description, :food_type, :name, :photo_url, :location
  
  validates_presence_of :description, :name, :food_type, :location
  
  validates_format_of :photo_url, :with => %r{.(gif|jpg|png)$}i, :allow_blank => true
  
  
  def self.by_filter(filter)
    
    unless filter == "All"
      where("food_type = ?", filter)
    else
      all
    end
    
  end
  
end
