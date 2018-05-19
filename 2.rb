require 'date'
class Course
  attr_reader :name, :dates

  def initialize(name, *dates)
    @name = name
    @dates = dates.map { |date| Date.parse(date) }
  end

  def courses_start(date_start)
    #raise ArgumentError.new('that date does not exist') if date_start
    @dates.select { |date| date < date_start }
  end

  def courses_finish(date_finish)
    @dates.select { |date| date > date_finish }
  end
end

courses = []
data = File.open('cursos.txt', 'r', &:readlines)
data.each do |lines|
  ls = lines.split(', ')
  courses << Course.new(*ls)
end
#print courses

print courses[1].courses_start(Date.today)
print courses[0].courses_finish(Date.today)
