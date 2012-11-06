module A
  refine Array do
    def b_me
      puts "b"
    end
  end
  refine String do
    using A
    def b
      [].b_me
    end
  end
end

using A
"b".b
# b