module A
  refine String do
    def a
      puts "a"
    end
  end
  refine String do
    def b
      a
    end
  end
end

using A
"b".b
# a
