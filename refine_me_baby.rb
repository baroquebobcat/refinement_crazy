def require x
  if x.include? 'core_ext' and !x.include? 'psych'
    puts "wtf #{x}", caller.first
  else
    super
  end
end
module ActiveSupportCoreRefinements
  active_support_no_deps, active_support_deps =  Dir[Gem.find_files('active_support/core_ext').first.sub('.rb','') + "/**/*.rb"].partition do |core_ext|
    file_contents = open(core_ext).read
    !file_contents.match /require.*core_ext.*/
  end
  
  def self.refineify file_contents, file
    file_contents.gsub!(/^\s*require\s*.*core_ext.*\s*$/, '')
    if file_contents.gsub!(/^\s*(class|module) (\S*)\s*$/i, "refine \\2 do")
      eval file_contents rescue puts "#{file} failed to eval"
      puts 1.day, file  rescue print '.'
    end
  end

  ActiveSupportCoreRefinementsBase = Module.new  do
    active_support_no_deps.each do |core_ext|
      file_contents = open(core_ext).read
      ActiveSupportCoreRefinements.refineify file_contents, core_ext
    end
  end
  
  using ActiveSupportCoreRefinementsBase
  puts nil, "dependent"
  active_support_deps.each do |core_ext|
    file_contents = open(core_ext).read
    refineify file_contents, core_ext
  end
end
