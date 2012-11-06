# It looks like order of methods doesn't matter if you use include in the 
# refine block. Nice.

module A
  def a
    puts "a"
  end
  refine String do
    include A
    def b
      puts "b"
      raise "an exception"
    end
  end
end

using A
"b".a
"b".b
#a
#b
#raises_exception.rb:12:in `b': an exception (RuntimeError)
#	from raises_exception.rb:20:in `<main>'
