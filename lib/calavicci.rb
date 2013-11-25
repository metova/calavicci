require "calavicci/version"
require 'optparse'

module Calavicci
  class DrawableConverter
    def scale
      puts 'Scaling...'
      
      options = {}
      OptionParser.new do |opts|
        opts.banner = "Usage: calavicci [options]"

        opts.on('-o', '--output DIRECTORY', 'Output Directory') do |opt|
          options[:output_directory] = [] unless options[:output_directory]
          options[:output_directory] << opt
        end
      end.parse!
      
      if ARGV[0].nil?
        raise ArgumentError, 'No input directory given!'
      end
      
      input_directory = ARGV[0].chomp('/')
      arguments = ""
      if options[:output_directory].nil? || options[:output_directory].length == 0
        # Guess the mdpi and hdpi directories based on the given input directory
        arguments += "-d #{input_directory}/../drawable-mdpi "
        arguments += "-d #{input_directory}/../drawable-hdpi "
      else
        options[:output_directory].each do |output_directory|
          arguments += "-d #{output_directory} "
        end
      end
      
      input_directory += "/*.png"
      python_command = "python bin/drawable_convert.py #{arguments}#{input_directory}"
      
      puts "Executing #{python_command}"
      result = exec(python_command)
    end
  end
end
