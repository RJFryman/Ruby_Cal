class Month
  attr_reader :month
  attr_reader :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def length
    case @month
    when 1,3,5,7,8,10,12
      31
    when 2
      leap_year? ? 29 :28
    else
      30
    end
  end

  def to_s
    body = "#{header}\n"
    body << "#{week_days}\n"
    week_numbers_rstrip = week_numbers.collect{ |w| w.rstrip}
    body << "#{week_numbers_rstrip.join("\n")}\n"
  end

  def to_a
    body = []
    body << "#{month_name}".center(20)
    body << week_days
    body.concat(week_numbers)
  end

  private

  def leap_year?
    if (@year % 400 == 0)
      true
    elsif (@year % 100 == 0)
      false
    elsif (@year % 4 == 0)
      true
    else
      false
    end
  end

  def month_name
    month_names= %w(January February March April May June July August September October November December)
    month_names[@month-1]
  end

  def start_day
    start_day = zeller(month_name, 1, @year)
  end

  def header
    "#{month_name} #{@year}".center(20).rstrip
  end

  def week_days
    "Su Mo Tu We Th Fr Sa"
  end

  def week_numbers
    week_number_array = ("01".."#{length}").to_a

    week_number_array.each do |s|
      s.gsub!(/0/, "\s") if s < "10"
    end

    start_day_index = %w[Sunday Monday Tuesday Wednsday Thursday Friday Saturday]
    n = start_day_index.index(start_day)

    n.times do
      week_number_array.unshift "\s\s"
    end
    until week_number_array.length == 42
      week_number_array.push "\s\s"
    end

    week_array = []
    6.times do |w|
      week_array << "#{(week_number_array[w*7,7].join("\s"))}"
    end
    week_array
  end
end

