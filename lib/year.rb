class Year

  def initialize(year)
    @year = year
  end

  def triforce_months(first, second, third)
    first = Month.new(first, @year).to_a
    second = Month.new(second, @year).to_a
    third = Month.new(third, @year).to_a
    triplet = first.zip(second, third)
    triplet.collect{ |x| x.join("\s\s").rstrip}.join("\n")
  end

  def to_s
    body = "#{banner}\n\n"
    body << "#{triforce_months(1,2,3)}\n"
    body << "#{triforce_months(4,5,6)}\n"
    body << "#{triforce_months(7,8,9)}\n"
    body << "#{triforce_months(10,11,12)}\n"
  end

  private

  def banner
    "#{@year}".center(62).rstrip
  end
end
