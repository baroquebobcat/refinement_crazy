module A
  refine String do
    def blah; "blah" ; end
  end
end

class ClassMethodOverrideNeedsAReRun
  def self.wargh
    puts "aoeuhtnso".blah rescue puts "not available"
    using A
  end
end

ClassMethodOverrideNeedsAReRun.wargh
ClassMethodOverrideNeedsAReRun.wargh
