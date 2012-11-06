module Refinery
  def refinery mod, type: Object
    if RUBY_VERSION.start_with? "2"
      refine(type) { include mod }
    else
      type.class_eval { include }
    end
  end
end

module A
  extend Refinery
  module StringExt
    def a
      puts "a"
    end
  end

  refinery StringExt, type: String
end


using A
"b".a
