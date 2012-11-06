# It looks like order of methods doesn't matter if you use include in the 
# refine block. Nice.

module A
  def a
    puts "a"
  end
  refine String do
    include A
  end
  def b
    puts "b"
  end
end

using A
"b".a
"b".b
# a
# b
