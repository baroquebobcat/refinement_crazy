module A
end

module B
  using A
  refine String do
    def b
      a
    end
  end
end

module A
  refine String do
    def a
      puts "a"
    end
  end
end

using A
using B
"b".b
#a.rb:8:in `b': undefined local variable or method `a' for "b":String (NameError)
#	from a.rb:23:in `<main>'
