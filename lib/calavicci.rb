require "calavicci/version"
require 'optparse'

module Calavicci

  class DrawableConverter
  
    def root
      File.expand_path '../..', __FILE__
    end

    def bin
      File.join root, 'bin'
    end
  
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
      
      drawable_convert_python_script = "#{bin}/drawable_convert.py"
      puts drawable_convert_python_script
      input_directory += "/*.png"
      python_command = "python #{drawable_convert_python_script} #{arguments}#{input_directory}"
      
      puts "Executing #{python_command}"
      result = exec(python_command)
    end
  end
end
