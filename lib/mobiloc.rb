# Project MobiLoc: Gets e-book location by page or section for Ruby Programming 1.9 book

require_relative 'mobidata'   # e-book data for first 5 chapters of Programming Ruby 1.9 book

class PlaceInBook
  
  include Enumerable
  
  attr_accessor :chapter, :subsection, :topic, :page, :location
 
# process user input of a page or section
  def process_input(input)    
    @input = input
    if @input.include?("sec")
      @section = @input.gsub("sec ","")
      @section = @section.split('.')
      @chapter = @section.first.to_i
      @subsection = @section.last.to_i
      puts "Finding section #{@chapter}.#{@subsection}..."
    elsif
      @input =~ /^[0-9]+$/
      @page = @input.to_i
      puts "Finding page #{@page}..."
    else puts "Not a page or section."  
    end  
  end
    
# get location in e-book from section
  def locate_section
  result_array = $book_data.find_all { |place| place[:chapter]==@chapter && place[:subsection]==@subsection }
   @place = result_array[0]
   @location = @place[:location]
   @topic = @place[:topic]
   puts "The e-book location is: #{@location}"
   puts "...and the topic is: #{@topic}."
   puts "Happy reading"
  end
 
# get location in e-book from page -- method not yet implemented
# concept is to interpolate location linearly from page range bounded by two adjacent page entries 
 
end   # PlaceInBook class end

# prompt and take in initial user input
print "To find a Kindle .mobi location, enter a page number (e.g., 123), or type 'sec' plus a section number (e.g., sec 3.2):"
entered_text = gets.chomp
puts "You entered: #{entered_text}"
pib = PlaceInBook.new
pib.process_input(entered_text)
pib.locate_section   
