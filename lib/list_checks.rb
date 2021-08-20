require 'date'

module ListChecks
  def date_calculator(element)
    string_date = ''
    new = element.split('/')
    string_date += new.last
    string_date += new[1].rjust(2,'0')
    string_date += new.first
    Date.parse(string_date)
  end

  def gender(element)
    if element.downcase == 'm'
      'Male'
    elsif element.downcase == 'f'
      "Female"
    else
      "N/A"
    end
  end

  def date(element)
    element.gsub('-', '/')
  end

  def check_args(parameters)
    key = {'lastname': 0,
          'firstname': 1,
          'gender': 2,
          'birthdate': 3,
          'color': 4,
          'desc': 'reverse'
          }

    parameters.map do |arg|
      key[arg.downcase.to_sym]
    end
  end
end
