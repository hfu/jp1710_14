require 'find'
require 'fileutils'

def show(r, c)
  print "count = #{c}\n"
  r.keys.sort{|a, b| r[b] <=> r[a]}.each{|k|
    print "#{k} - #{r[k]}\n"
  }
  print "---\n"
end

r = Hash.new {|h, k| h[k] = 0}
c = 0
Find.find('.') {|path|
  next unless path.end_with?('mvt')
  c += 1
  size = File.size(path)
  r[size] += 1 if size <= 1000
  show(r, c) if c % 1000 == 0
}
show(r, c)
