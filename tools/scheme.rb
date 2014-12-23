# Automate building of palette BEM variables
class Palette
   def initialize(export)
   		@preprocessor = export
    	@colors = ['primary', 'secondary', 'tertiary', 'quaternary', 'quinary', 'senary', 'septenary', 'octonary', 'nonary', 'denary']
    	@variations = ['dim', 'bright']
    	@tones = ['darkest', 'darker', 'dark', 'base', 'light', 'lighter', 'lightest']
   end
   def export_file
   		case @preprocessor
   		when 'sass'
   			@file = File.open("settings/_colors.scss", "w")
   		else
   			puts "The preprocessor #{@preprocessor} is not supported currently"
   		end
    	self.process_colors
   end
   def process_colors
   		for color in @colors;
   			self.process_variations(color)
   		end
   end
   def process_variations(color)
   		for variation in @variations;
   			self.process_tones(color, variation)
      	end
   end
   def process_tones(color, variation)
   		for tone in @tones
   			self.output_bem_variable(color, variation, tone)
   		end
   end
   def output_bem_variable(color, variation, tone)
   		# Filter out BEM modifiers
   		case tone
   		when 'base'
   			@file.puts "$#{color}-color__#{variation}: get-tone($#{color}-color, #{variation});"
   		else
   			@file.puts "$#{color}-color__#{variation}--#{tone}: get-tone($#{color}-color, #{variation}, #{tone});"
   		end
   end
end

color_scheme = Palette.new('sass')
color_scheme.export_file