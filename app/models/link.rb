class Link < ActiveRecord::Base
    
  YEAR_SEARCH = '{year}'
  
  validates_presence_of :name
  validates_presence_of :url
  
  def self.clean_for_year(year)
    all = Link.all
    Link.all.each do |link|
      link.name.gsub! YEAR_SEARCH, year.to_s[2..4]
      link.url.gsub! YEAR_SEARCH, year.to_s
    end 
    all
  end
  
  def self.mass_fields
    [:name, :url]
  end

end
