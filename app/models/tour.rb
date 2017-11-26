class Tour < ActiveRecord::Base

  has_many :shows

  def self.unique_years
    years = []
    Tour.all.each {|t| years << t.year}
    years.uniq!
  end

end
