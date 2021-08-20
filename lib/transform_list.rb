require 'date'
require './lib/list_checks'

class TransformList
  attr_reader :old_list, :args, :new_file
  include ListChecks

  def initialize(old_list, args)
    @old_list = old_list
    @args = args
    @new_file = []
  end

  def new_output(file_name)
    file_info = transform_array_to_string
    write_new_file(file_info, "#{file_name}")
  end

  def transform_list
    text = @old_list.read
    text.each_line do |line|
      check_delimiter(line.split)
    end
  end

  def check_delimiter(line)
    if line[0][-1] == ','
      comma_transform(line)
    elsif line[1] == '|'
      space_or_pipe_elements('pipe',line)
    else
      space_or_pipe_elements('space',line)
    end
  end

  def comma_transform(line)
    counter = 0
    new_line = []
    4.times do
      new_line << line[counter][0..-2]
      counter += 1
    end
    new_line.insert(-2, line[4])
    @new_file << new_line
  end

  def pipe_or_space_transform(array_arg)
    new_line = array_arg.reduce([]) do |memo, element|
      memo << element
      memo
    end
    @new_file << new_line
  end

  def space_or_pipe_elements(arg, line)
    if arg == 'pipe'
      pipe_elements = [line[0], line[2], gender(line[6]), date(line[10]), line[8]]
      pipe_or_space_transform(pipe_elements)
    elsif arg == 'space'
      space_elements = [line[0], line[1], gender(line[3]), date(line[4]), line[5]]
      pipe_or_space_transform(space_elements)
    end
  end

  def transform_array_to_string
    transform_list
    sorting_list
    @new_file.map do |line|
      new_line = line.join(' ')
      new_line += "\n"
    end.join
  end

  def write_new_file(info, name)
    destination_file = File.open("files/#{name}.txt", "w" )
    destination_file.write(info)
  end

  def sorting_list
    arguement = check_args(@args)
    @new_file = @new_file.sort_by do |element|
      [element[arguement[0]], element[arguement[1]]]
    end
  end
end
