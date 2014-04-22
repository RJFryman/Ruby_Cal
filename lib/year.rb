class Year

  def initialize(year)
    @year = year
  end

  def banner
    "#{@year}".center(62).rstrip
  end

  def to_month(month, year)
    month = Month.new(month, year)
    month.year_conversion
  end

  def triforce_months(first, second, third)
    triplet = to_month(first, @year).zip to_month(second, @year), to_month(third, @year)
    triplet.collect{ |x| x.join("\s\s").rstrip}.join("\n")
  end


  def to_s
    body = "#{banner}\n\n"
    body << "#{triforce_months(1,2,3)}\n"
    body << "#{triforce_months(4,5,6)}\n"
    body << "#{triforce_months(7,8,9)}\n"
    body << "#{triforce_months(10,11,12)}\n"
  end
end
