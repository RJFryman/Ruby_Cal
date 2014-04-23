require 'test/unit'
require 'zeller'
require 'month'
require 'year'

class CalUnitTest < MiniTest::Unit::TestCase

  def test_02a_zeller_day_start_day
    day = zeller("January",1,1800)
    assert_equal "Wednsday", day
  end 

  def test_02b_zeller_day_end_day
    day = zeller("December",31,3000)
    assert_equal "Wednsday", day
  end

  def test_02c_zeller_day_4_18_2014
    day = zeller("April",18,2014)
    assert_equal "Friday", day
  end

  def test_02d_zeller_day_2_29_1940
    # Gone with the Wind wins 8 Oscars
    day = zeller("February",29,1940)
    assert_equal "Thursday", day
  end

  def test_02e_zeller_day_3_6_1836
    # Remember the Alamo
    day = zeller("March",6,1836)
    assert_equal "Sunday", day
  end

  def test_02f_zeller_day_5_23_2511
    # Battle of Serenity Valley
    day = zeller("May",23,2511)
    assert_equal "Saturday", day
  end

  def test_02g_zeller_day_36_18_1812
    # War of 1812 starts
    day = zeller("June",18,1812)
    assert_equal "Thursday", day
  end

  def test_02h_zeller_day_7_20_1069
    # Landing of the moon.first?
    day = zeller("July",20,1969)
    assert_equal "Sunday", day
  end

  def test_02i_zeller_day_8_13_1935
    # Transcontinetnal Roller Derby begins
    day = zeller("August",13,1935)
    assert_equal "Tuesday", day
  end

  def test_02j_zeller_day_9_12_1954
    # Lassie television debut
    day = zeller("September",12,1954)
    assert_equal "Sunday", day
  end

  def test_02k_zeller_day_10_20_1803
    # Louisiana Purchase
    day = zeller("October", 20, 1803)
    assert_equal "Thursday", day
  end

  def test_02l_zeller_day_11_5_1605
    # Remember Remember the Fifth of November
    day = zeller("November", 5, 1605)
    assert_equal "Saturday", day
  end

  def test_07a_month_how_many_days_in_month
    month = Month.new(1, 2014)
    assert_equal(31, month.length)
  end

  def test_07b_month_how_many_days_in_month
    month = Month.new(2, 2014)
    assert_equal(28, month.length)
  end

  def test_07c_month_how_many_days_in_month
    month = Month.new(2, 2012)
    assert_equal(29, month.length)
  end

  def test_07d_month_how_many_days_in_month
    month = Month.new(4, 2014)
    assert_equal(30, month.length)
  end

  def test_11_to_s
    cal = Month.new(1,2014)
    assert_equal("    January 2014
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31

", cal.to_s)
  end

  def test_12_year_to_a
    cal = Month.new(1, 2014)
    assert_equal([
"      January       ",
"Su Mo Tu We Th Fr Sa",
"          1  2  3  4",
" 5  6  7  8  9 10 11",
"12 13 14 15 16 17 18",
"19 20 21 22 23 24 25",
"26 27 28 29 30 31   ",
"                    "
], cal.to_a)
  end

  def test_15_year_to_s
    cal = Year.new(2014)
    assert_equal("                             2014

      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1                     1
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   2  3  4  5  6  7  8
12 13 14 15 16 17 18   9 10 11 12 13 14 15   9 10 11 12 13 14 15
19 20 21 22 23 24 25  16 17 18 19 20 21 22  16 17 18 19 20 21 22
26 27 28 29 30 31     23 24 25 26 27 28     23 24 25 26 27 28 29
                                            30 31
       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5               1  2  3   1  2  3  4  5  6  7
 6  7  8  9 10 11 12   4  5  6  7  8  9 10   8  9 10 11 12 13 14
13 14 15 16 17 18 19  11 12 13 14 15 16 17  15 16 17 18 19 20 21
20 21 22 23 24 25 26  18 19 20 21 22 23 24  22 23 24 25 26 27 28
27 28 29 30           25 26 27 28 29 30 31  29 30

        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5                  1  2      1  2  3  4  5  6
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   7  8  9 10 11 12 13
13 14 15 16 17 18 19  10 11 12 13 14 15 16  14 15 16 17 18 19 20
20 21 22 23 24 25 26  17 18 19 20 21 22 23  21 22 23 24 25 26 27
27 28 29 30 31        24 25 26 27 28 29 30  28 29 30
                      31
      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
          1  2  3  4                     1      1  2  3  4  5  6
 5  6  7  8  9 10 11   2  3  4  5  6  7  8   7  8  9 10 11 12 13
12 13 14 15 16 17 18   9 10 11 12 13 14 15  14 15 16 17 18 19 20
19 20 21 22 23 24 25  16 17 18 19 20 21 22  21 22 23 24 25 26 27
26 27 28 29 30 31     23 24 25 26 27 28 29  28 29 30 31
                      30
", cal.to_s)
  end

end

