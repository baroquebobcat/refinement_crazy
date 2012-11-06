module A
  refine String do
    def a
      puts "a"
    end
  end
end


module B
  using A
  refine String do
    def b
      a
    end
  end
end

using A
using B
"b".b
# a