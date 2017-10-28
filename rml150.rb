require 'find'
require 'fileutils'

r = {:true => {:count => 0, :size => 0}, :false => {:count => 0, :size => 0}}
Find.find('.') {|path|
  next unless path.end_with?('mvt')
  size = File.size(path)
  if size < 150
    r[:false][:count] += 1
    r[:false][:size] += size
    FileUtils::rm(path)
  else
    r[:true][:count] += 1
    r[:true][:size] += size
  end
  p r
}
