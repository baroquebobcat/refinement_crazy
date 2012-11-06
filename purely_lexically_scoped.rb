module A
  refine String do
    def a
      puts "a"
    end
  end
end


module B
  refine String do
    def b
      a
    end
  end
end

using A
using B
"b".b
#a.rb:13:in `b': undefined local variable or method `a' for "b":String (NameError)
#	from a.rb:20:in `<main>'
