module A
  refine String do
    p self         # => #<Module:0x11111111111> - an anonymous module??
  end
  p self           # => A
end
