module Slugifiable
  module InstanceMethods
    def slug
      self.title.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|g| g.slug == slug  }
    end
  end
end