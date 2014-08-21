#require_relative 'puzzle.rb'


@puzzle =  [0,0,0], [0,0,0], [0,0,0],
           [0,0,0], [0,0,0], [0,0,0],
           [0,0,0], [0,0,0], [0,0,0],

           [0,0,0], [1,2,3], [0,0,0],
           [0,0,0], [4,5,6], [0,0,0],
           [0,0,0], [7,8,9], [0,0,0],

           [0,0,0], [0,0,0], [0,0,0],
           [0,0,0], [0,0,0], [0,0,0],
           [0,0,0], [0,0,0], [0,0,0]



#p puzzle.fill(0)




def row0
  @row0 = @puzzle[ 0] + @puzzle[ 1] + @puzzle[ 2]
end

def row1
  @row1 = @puzzle[ 3] + @puzzle[ 4] + @puzzle[ 5]
end

def row2
  @row2 = @puzzle[ 6] + @puzzle[ 7] + @puzzle[ 8]
end

def row3
  @row3 = @puzzle[ 9] + @puzzle[10] + @puzzle[11]
end

def row4
  @row4 = @puzzle[12] + @puzzle[13] + @puzzle[14]
end

def row5
  @row5 = @puzzle[15] + @puzzle[16] + @puzzle[17]
end

def row6
  @row6 = @puzzle[18] + @puzzle[19] + @puzzle[20]
end

def row7
  @row7 = @puzzle[21] + @puzzle[22] + @puzzle[23]
end

def row8
  @row8 = @puzzle[24] + @puzzle[25] + @puzzle[26]
end

def col0
  @col0 =  
  [@puzzle[ 0][0]] << @puzzle[ 3][0] << @puzzle[ 6][0] << 
   @puzzle[ 9][0] << @puzzle[12][0] << @puzzle[15][0] << 
   @puzzle[18][0] << @puzzle[21][0] << @puzzle[24][0]
end

def col1
  @col1 =  
  [@puzzle[ 0][1]] << @puzzle[ 3][1] << @puzzle[ 6][1] << 
   @puzzle[ 9][1] << @puzzle[12][1] << @puzzle[15][1] << 
   @puzzle[18][1] << @puzzle[21][1] << @puzzle[24][1]
end             

def col2
  @col2 =  
  [@puzzle[ 0][2]] << @puzzle[ 3][2] << @puzzle[ 6][2] << 
   @puzzle[ 9][2] << @puzzle[12][2] << @puzzle[15][2] <<
   @puzzle[18][2] << @puzzle[21][2] << @puzzle[24][2]
end

def col3
  @col3 =   
  [@puzzle[ 1][0]] << @puzzle[ 4][0] << @puzzle[ 7][0] << 
   @puzzle[10][0]  << @puzzle[13][0] << @puzzle[16][0] << 
   @puzzle[19][0]  << @puzzle[22][0] << @puzzle[25][0]
end

def col4
  @col4 = [] <<
  @puzzle[ 1][1] << @puzzle[ 4][1] << @puzzle[ 7][1] << 
  @puzzle[10][1] << @puzzle[13][1] << @puzzle[16][1] << 
  @puzzle[19][1] << @puzzle[22][1] << @puzzle[25][1]
end

def col5
  @col5 = [] << 
  @puzzle[ 1][2] << @puzzle[ 4][2] << @puzzle[ 7][2] << 
  @puzzle[10][2] << @puzzle[13][2] << @puzzle[16][2] << 
  @puzzle[19][2] << @puzzle[22][2] << @puzzle[25][2]
end

def col6
  @col6 = [] << 
  @puzzle[ 2][0] << @puzzle[ 5][0] << @puzzle[ 8][0] << 
  @puzzle[11][0] << @puzzle[14][0] << @puzzle[17][0] << 
  @puzzle[20][0] << @puzzle[23][0] << @puzzle[26][0]
end

def col7
  @col7 = [] << 
  @puzzle[ 2][1] << @puzzle[ 5][1] << @puzzle[ 8][1] << 
  @puzzle[11][1] << @puzzle[14][1] << @puzzle[17][1] << 
  @puzzle[20][1] << @puzzle[23][1] << @puzzle[26][1]
end

def col8
  @col8 = [] << 
  @puzzle[ 2][2] << @puzzle[ 5][2] << @puzzle[ 8][2] << 
  @puzzle[11][2] << @puzzle[14][2] << @puzzle[17][2] << 
  @puzzle[20][2] << @puzzle[23][2] << @puzzle[26][2]
end

def box0
  @box0 =  @puzzle[ 0] + @puzzle[ 3] + @puzzle[ 6]
end

def box1
  @box1 =  @puzzle[ 1] + @puzzle[ 4] + @puzzle[ 7]
end

def box2
  @box2 =  @puzzle[ 2] + @puzzle[ 5] + @puzzle[ 8]
end

def box3
  @box3 =  @puzzle[ 9] + @puzzle[12] + @puzzle[15]
end

def box4
  @box4 =  @puzzle[10] + @puzzle[13] + @puzzle[16]
end

def box5
  @box5 =  @puzzle[11] + @puzzle[14] + @puzzle[17]
end

def box6
  @box6 =  @puzzle[18] + @puzzle[21] + @puzzle[24]
end

def box7
  @box7 =  @puzzle[19] + @puzzle[22] + @puzzle[25]
end

def box8
  @box8 =  @puzzle[20] + @puzzle[23] + @puzzle[26]
end

#p test = box4.shuffle
#p test.each_slice(3).to_a

@x = [1,2,3,4,5,6,7,8,9]
@temp = []


def generate_center
  @x.shuffle!
  @puzzle[10] = @x[0,3]
  @puzzle[13] = @x[3,3]
  @puzzle[16] = @x[6,3]
end

def generate_left_and_right_center
  @temp1, @temp2, @temp3 = [], [], []

  @temp1 = @x.shuffle - @puzzle[10]
  @temp2 = @x.shuffle - @puzzle[13]
  @temp3 = @x.shuffle - @puzzle[16]

  @puzzle[9] = (@temp1 & @temp2)
  @puzzle[11] = @x.shuffle - @puzzle[10] - @puzzle[9]

  @puzzle[12] = (@temp2 & @temp3)
  @puzzle[14] = @x.shuffle - @puzzle[13] - @puzzle[12]
  
  @puzzle[15] = (@temp3 & @temp1)
  @puzzle[17] = @x.shuffle - @puzzle[16] - @puzzle[15]
end
  
def generate_top_and_bottom_center
  @temp1, @temp2, @temp3 = [], [], []

  @temp1 = @x.shuffle - col3
  @temp2 = @x.shuffle - col4
  @temp3 = @x.shuffle - col5

  

  @temp1a = (@temp1 & @temp2) ## top_center, first column
  @temp2a = (@temp2 & @temp3)
  @temp3a = (@temp3 & @temp1)

   @puzzle[ 1][0] = (@temp1 & @temp2)[0] #top_center, first column
   @puzzle[ 4][0] = (@temp1 & @temp2)[1] #
   @puzzle[ 7][0] = (@temp1 & @temp2)[2] #
  
  #@temp1top = [@puzzle[1][0]] << @puzzle[ 4][0] << @puzzle[ 7][0]

   @puzzle[19][0] = (@temp1 - @temp1a)[0] # bottom_center, first column
   @puzzle[22][0] = (@temp1 - @temp1a)[1] #
   @puzzle[25][0] = (@temp1 - @temp1a)[2] #

 #@temp1bottom = [@puzzle[19][0]] << @puzzle[22][0] << @puzzle[25][0] ## bottom_center, first column

   @puzzle[ 1][1] = (@temp2 - @temp1a)[0] 
   @puzzle[ 4][1] = (@temp2 - @temp1a)[1] 
   @puzzle[ 7][1] = (@temp2 - @temp1a)[2]

 # @temp2top = [@puzzle[1][1]] << @puzzle[ 4][1] << @puzzle[ 7][1]

#@temp2bottom = @temp2 - @temp2top

   @puzzle[19][1] = (@temp2 - @temp2a)[0] 
   @puzzle[22][1] = (@temp2 - @temp2a)[1]
   @puzzle[25][1] = (@temp2 - @temp2a)[2]

  #p @temp2bottom = [@puzzle[19][1]] << @puzzle[22][1] << @puzzle[25][1]

  @puzzle[ 1][2] = (@temp3 - @temp2a)[0]
  @puzzle[ 4][2] = (@temp3 - @temp2a)[1]
  @puzzle[ 7][2] = (@temp3 - @temp2a)[2]

  @puzzle[19][2] = (@temp3 - @temp3a)[0]
  @puzzle[22][2] = (@temp3 - @temp3a)[1]
  @puzzle[25][2] = (@temp3 - @temp3a)[2]

    #p @temp3bottom = [@puzzle[19][2]] << @puzzle[22][2] << @puzzle[25][2]

end

def print_puzzle
  p row0, row1, row2, row3, row4, row5, row6, row7, row8
end

generate_center
generate_left_and_right_center
generate_top_and_bottom_center
#print_puzzle




puts
## row 0 box 0
def box0r1c0 (x = [])
  @x.shuffle - row0 - col0 - x
end
p box0r1c0

def box0r1c1(x = [])
  @x.shuffle - row0 - col1 - x
end
p box0r1c1

def box0r1c2(x = [])
  @x.shuffle - row0 - col2 - x
end
p box0r1c2

def box0r1a
  box0r1c0 & box0r1c1
end
p box0r1a

def box0r1b
  box0r1c1 & box0r1c2
end
p box0r1b

def box0r1c
  box0r1c2 & box0r1c0
end
p box0r1c
 # p box0r1a.length
 # p box0r1b.length
 # p box0r1c.length

#p test

#p test = test.sort_by { |x| x.length }

## row 0 box 2
  box0r1c6 = @x.shuffle - row0 - col6
  box0r1c7 = @x.shuffle - row0 - col7
  box0r1c8 = @x.shuffle - row0 - col8

 box0r1c6a = box0r1c6 & box0r1c7
 box0r1c7b = box0r1c7 & box0r1c8
 box0r1c8c = box0r1c8 & box0r1c6

puts
## row 1 box 0
 @x.shuffle - row1 - col0
 @x.shuffle - row1 - col1
 @x.shuffle - row1 - col2
## row 1 box 2
 @x.shuffle - row1 - col6
 @x.shuffle - row1 - col7
 @x.shuffle - row1 - col8
puts
## row 2 box 0
 @x.shuffle - row2 - col0
 @x.shuffle - row2 - col1
 @x.shuffle - row2 - col2
## row 2 box 2
 @x.shuffle - row2 - col6
 @x.shuffle - row2 - col7
 @x.shuffle - row2 - col8
puts

puts 'test'
 #p test = [box0r1a, box0r1b, box0r1c]
 def baz
  [box0r1a, box0r1b, box0r1c]
 end
 puts
 test = baz

l = 1
3.times do
   i = 0
  test.each do |t|
     
      if t.length == l
        @puzzle[0][i] = t[0]
        box0r1c0 t
    
      end
        
      i += 1
  end
  l += 1

  puts 'test in loop'
  p baz
  #p test = [box0r1a, box0r1b, box0r1c]
end


print_puzzle

# p box0r1c0
# p box0r1c1
# p box0r1c2

# p box0r1a
# p box0r1b
# p box0r1c





