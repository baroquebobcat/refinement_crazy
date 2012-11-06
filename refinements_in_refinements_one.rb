module A
  refine String do
    using A
    def b
      [].b_me
    end
  end

  refine Array do
    def b_me
      puts "b"
    end
  end
end

using A
"b".b
#a.rb:5:in `b': undefined method `b_me' for []:Array (NoMethodError)
#	from a.rb:17:in `<main>'
