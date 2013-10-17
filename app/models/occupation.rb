class Occupation < ActiveRecord::Base


  class << self
    def for_select
      self.all.map{|occupation| [occupation.en_name, occupation.id]}
    end
  end
end
