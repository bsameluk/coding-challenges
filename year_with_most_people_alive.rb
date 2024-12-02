# You need to determine in which year of the 20th century the most people were alive. We have an array of data containing birth and death dates.

# Example 
# Input: data = [
#   {from: 1912, to: 1945},
#   {from: 1940, to: 1980},
#   {from: 1955, to: 1996},
#   {from: 1938, to: 1982},
#   {from: 1980, to: 1985},
#   {from: 1960, to: 1990},
#   {from: 1958, to: 1990},
#   {from: 1998, to: 2090},
#   {from: 1898, to: 1960}
# ]
# Output: 1960

# @param {Array} data
# @return {Integer}
def year_with_most_people_alive data
  _max_by_year = proc { |people| people.to_a.max_by {|(year, people)| people.count}.to_a}
  _max_count_by_year = proc { |people| _max_by_year.(people)[1]&.count.to_i}

  people_by_years = (1900..1999).reduce({}) do |result, year|
    filtred_people = data.select { |person| (person[:from]..person[:to]).include?(year) }
    result[year] = filtred_people if _max_count_by_year.(result) < filtred_people.count
    
    result
  end

  max = _max_by_year.(people_by_years)
  info = {year: max.first, count: max[1].count}
  info[:year]
end