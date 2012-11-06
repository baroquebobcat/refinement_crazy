# since a refine block is an anonymous module you can extend stuff with it
# 
module A
  refine String do
    def a
      puts 'a'
    end
    A.extend self
  end
end

A.a
# a
