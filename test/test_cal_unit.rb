require 'nss'
require 'zeller'

class LinkedListTest < MiniTest::Unit::TestCase

  def test_01_test
    assert true
  end

  def test_02_zeller_day_start_day
    day = zeller("January",1,1800)
    assert_equal "Wednsday", day
  end

  def test_03_zeller_day_end_day
    day = zeller("December",31,3000)
    assert_equal "Wednsday", day
  end

  def test_04_zeller_day_4_18_2014
    day = zeller("April",18,2014)
    assert_equal "Friday", day
  end

  def test_05_zeller_day_2_29_1940
    # Gone with the Wind wins 8 Oscars
    day = zeller("February",29,1940)
    assert_equal "Thursday", day
  end

  def test_06_zeller_day_3_6_1836
    # Remember the Alamo
    day = zeller("March",6,1836)
    assert_equal "Sunday", day
  end

  def test_07_zeller_day_5_23_2511
    # Battle of Serenity Valley
    day = zeller("May",23,2511)
    assert_equal "Saturday", day
  end

  def test_08_zeller_day_36_18_1812
    # War of 1812 starts
    day = zeller("June",18,1812)
    assert_equal "Thursday", day
  end

  def test_09_zeller_day_7_20_1069
    # Landing of the moon.first?
    day = zeller("July",20,1969)
    assert_equal "Sunday", day
  end

  def test_10_zeller_day_8_13_1935
    # Transcontinetnal Roller Derby begins
    day = zeller("August",13,1935)
    assert_equal "Tuesday", day
  end

  def test_11_zeller_day_9_12_1954
    # Lassie television debut
    day = zeller("September",12,1954)
    assert_equal "Sunday", day
  end

  def test_12_zeller_day_10_20_205
    # Louisiana Purchase
    day = zeller("October",20,1803)
    assert_equal "Thursday", day
  end

  def test_13_zeller_day_11_10_1990
    # Remember Remember the Fifth of November
    day = zeller("November",5,1605)
    assert_equal "Saturday", day
  end

end
