module A
  refine String do
    def a
      puts "a"
    end
  end
end


module B
  refine String do
    using A
    def b
      a
    end
  end
end

using A
using B
"b".b
#a