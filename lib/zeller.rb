def zeller(month, day, year)
  days = %w[Sunday Monday Tuesday Wednsday Thursday Friday Saturday]
  months = %w[march april may june july august september october november december january february]
  k = day
  m = months.index(month.downcase) + 1
  y = (m <= 10) ? year: year -1
  d = y % 100
  c = y / 100
  f = (((k + (((13*m)-1)/5) + d + (d/4) + c/4)+ (5*c)) % 7)
  days[f]
end


