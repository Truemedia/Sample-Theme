# Swap hexdecimal colors with defined LESS/SASS variables
class Replace_Colors
   def initialize(export)
   		@preprocessor = export
    	@input = File.read("settings/colors/input.css")
      @var_name_regex = /([a-z]*[-]{1}color__[a-z]*)(--[a-z]*)?/
      @hex_code_regex = /([#][a-zA-F0-9]{1,6})/
   end
   def export_file
   		case @preprocessor
   		when 'less'
   			@file = File.open("settings/colors/output.css", "w+")
   		else
   			puts "The preprocessor #{@preprocessor} is not supported currently"
   		end
    	self.process_colors
   end
   def process_colors
    puts "Replaced the following colors:"
      File.open("settings/colors/src.css", "r") do |file_handle|
        file_handle.each_line do |color|

          # Variable name
          var_name = color.scan(@var_name_regex)
          var_name = var_name.join("")

          # Hex code
          hex_code = color.scan(@hex_code_regex)
          hex_code = hex_code.join("")

          # Search and replace in provided css file
          self.process_color(var_name, hex_code)
        end
      end
      @file.puts @input
   end
   def process_color(var_name, hex_code)
      case @preprocessor
      when 'less'
        var_style = '@'
      end

      puts '`' + hex_code + '` replaced with: `' + var_style + var_name + '`'
      @input = @input.gsub!(hex_code, var_style + var_name)
   end
end

css_file = Replace_Colors.new('less')
css_file.export_file