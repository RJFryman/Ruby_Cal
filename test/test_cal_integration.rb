require 'nss'
require 'zeller'
require 'month'

def unix_whitespace_eliminator lines
  output = ""
  lines.each_line do |line|
    output.concat(line.rstrip + "\n")
  end
  return output
end

class CalIntergrationTest < Test::Unit::TestCase
  def test_12a_cal_Intergration_month
    assert_equal(`cal 01 1800`, `./cal 1 1800`)
  end
  def test_12b_cal_Intergration_month
    assert_equal(`cal 02 2012`, `./cal 2 2012`)
  end
  def test_12c_cal_Intergration_month
    assert_equal(`cal 02 1803`, `./cal 2 1803`)
  end
  def test_12d_cal_Intergration_month
    assert_equal(`cal 03 2014`, `./cal 3 2014`)
  end
  def test_12e_cal_Intergration_month
    assert_equal(`cal 02 1800`, `./cal 2 1800`)
  end
  def test_12f_cal_Intergration_month
    assert_equal(`cal 12 2012`, `./cal 12 2012`)
  end
  def test_12g_cal_Intergration_month
    assert_equal(`cal 02 2015`, `./cal 2 2015`)
  end
  def test_12h_cal_Intergration_month
    assert_equal(`cal 03 2015`, `./cal 3 2015`)
  end
  def test_13a_cal_intergration_year
    expected_output = unix_whitespace_eliminator `cal 2013`
    assert_equal(expected_output, `./cal 2013`)
  end
  def test_13b_cal_intergration_year
    expected_output = unix_whitespace_eliminator `cal 2012`
    assert_equal(expected_output, `./cal 2012`)
  end
  def test_13c_cal_intergration_year
    expected_output = unix_whitespace_eliminator `cal 2000`
    assert_equal(expected_output, `./cal 2000`)
  end
  def test_13d_cal_intergration_year
    expected_output = unix_whitespace_eliminator `cal 1990`
    assert_equal(expected_output, `./cal 1990`)
  end
end
