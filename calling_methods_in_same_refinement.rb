module A
  refine String do
    def a
      puts "a"
    end
    def b
      a
    end
  end
end

using A
"b".b
# a
