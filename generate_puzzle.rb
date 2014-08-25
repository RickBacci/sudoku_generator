require_relative 'empty_puzzle.rb'

require_relative 'puzzle_rows.rb'
require_relative 'puzzle_columns.rb'
require_relative 'puzzle_boxes.rb'

require_relative 'generate_left_and_right_center'
require_relative 'generate_top_and_bottom_center'

require_relative 'box_0'


@x = [1,2,3,4,5,6,7,8,9]

def generate_center
  @x.shuffle!
  @puzzle[10] = @x[0,3]
  @puzzle[13] = @x[3,3]
  @puzzle[16] = @x[6,3]
end

def print_puzzle
  p row0, row1, row2, row3, row4, row5, row6, row7, row8
end



def gen2 box

  def clear_array bx, num
    #p "this is in test method with #{num}"
    bx.each do |b|
      #p "remove #{num} and clear the rest of b #{b}"
      b.clear if b.include? num
      #b.delete(num)
    end
  end

  p box
  @numbers_set = []

  array_element = 0
  element_column = 0

  @numbers = [1,2,3,4,5,6,7,8,9]
  
  box.each do |element|
    puts "@puzzle[#{array_element}][#{element_column}] -- Begin"
    
    @numbers.each do |num|
      if ( box.flatten.count(num) == 1 ) && ( element.include?(num) )
        p "only 1 #{num} remaining"
        @puzzle[array_element][element_column] = num
        @numbers_set << num
        @numbers -= [num]
        
        #removes num from 'box'
        clear_array(box, num)
      end
    end
    #p element

    puts "@puzzle[#{array_element}][#{element_column}] -- End"

    if element_column == 2
        element_column = 0
      if array_element == 6
        array_element = 0
      else
        array_element += 3
      end
    else
      element_column += 1
    end

    p "numbers that were set: #{@numbers_set}"
    p "numbers remaining to loop thru: #{@numbers}"
    p "numbers remaining in box: #{box}"
  end

  if box.flatten == []
    p "All done"
  else
    gen2 box 
  end
end

#generate_center
#generate_left_and_right_center
#generate_top_and_bottom_center
#gen2 box


gen2 [[9],[2,3],[3],[4],[6],[5],[7],[8],[1]]
print_puzzle
puts "---------------------------------------------------------------------------------------------"
gen2 [[1],[8],[7],[5],[6],[4],[3],[3,2],[9]] ## working with .clear instead of .pop
print_puzzle
puts "---------------------------------------------------------------------------------------------"
#gen2 [[2],[9,4,5],[3,7,8],[4,1,6],[5,6],[1],[7,2,4],[1,8],[5,3]]




#gen2 [[1],[8],[7],[5],[6],[4],[3,2],[2,3],[9]] ## will not work until i use recursion thru all blocks again



