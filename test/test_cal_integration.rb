require 'test/unit'
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
  def test_12a_cal_intergration_month_error
    shell_output = `./cal 00 1800`
    assert_equal(64, $?.exitstatus)
  end

  def test_12b_cal_intergration_month_error
    shell_output = `./cal 13 1800`
    assert_equal(64, $?.exitstatus)
  end

  def test_12c_cal_intergration_year_error
    shell_output = `./cal 1 1799`
    assert_equal(64, $?.exitstatus)
  end

  def test_12d_cal_intergration_year_error
    shell_output = `./cal 1 3001`
    assert_equal(64, $?.exitstatus)
  end

  def test_13a_cal_Intergration_month
    expected_output = unix_whitespace_eliminator `cal 01 1800`
    assert_equal(expected_output, `./cal 1 1800`)
  end

  def test_13b_cal_Intergration_month
    expected_output = unix_whitespace_eliminator `cal 02 2012`
    assert_equal(expected_output, `./cal 2 2012`)
  end

  def test_13c_cal_Intergration_month
    expected_output = unix_whitespace_eliminator `cal 02 1803`
    assert_equal(expected_output, `./cal 2 1803`)
  end

  def test_13d_cal_Intergration_month
    expected_output = unix_whitespace_eliminator `cal 03 2014`
    assert_equal(expected_output, `./cal 3 2014`)
  end

  def test_13e_cal_Intergration_month
    expected_output = unix_whitespace_eliminator `cal 02 1800`
    assert_equal(expected_output, `./cal 2 1800`)
  end

  def test_13f_cal_Intergration_month
    expected_output = unix_whitespace_eliminator `cal 12 2012`
    assert_equal(expected_output, `./cal 12 2012`)
  end

  def test_13g_cal_Intergration_month
    expected_output = unix_whitespace_eliminator `cal 02 2015`
    assert_equal(expected_output, `./cal 2 2015`)
  end

  def test_13h_cal_Intergration_month
    expected_output = unix_whitespace_eliminator `cal 03 2015`
    assert_equal(expected_output, `./cal 3 2015`)
  end
end
