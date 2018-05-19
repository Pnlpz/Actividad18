class Table
  attr_reader :table, :collects

  def initialize(table, *collects)
    @table = table
    @collects = collects.map(&:to_i)
  end

  def max(*)
    @collects.max
  end

  def average
   @collects.inject(&:+) / @collects.size(&:to_f)
  end
end

mesas = []
data = File.open('casino.txt', 'r', &:readlines)
data.each do |lines|
  ls = lines.split(', ')
  mesas << Table.new(*ls)
end

#print mesas

promedios = mesas.map(&:average)
puts promedios.inject(&:+) / promedios.size

puts mesas.map(&:max)
