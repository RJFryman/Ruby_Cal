class Month
  attr_reader :month
  attr_reader :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def is_leap_year?
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

  def months_long_spelling
    month_names= %w(January February March April May June July August September October November December)
    month_names[@month-1]
  end


  def days_in_month
    case @month
    when 1,3,5,7,8,10,12
      31
    when 2
      is_leap_year? ? 29 :28
    else
      30
    end
  end

  def start_day
    start_day = zeller(months_long_spelling, 1, @year)
  end

  def header
    "#{months_long_spelling} #{@year}".center(20)
  end

  def week_days
    "Su Mo Tu We Th Fr Sa"
  end


end

