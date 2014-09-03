
def clear_all
  clear_rows
  clear_columns
  clear_boxes
end

def clear_rows
  (0..8).each do |row_number|
    @new_puz[row_number].each do |row_val|
      if row_val.is_a? Integer
        num = row_val
        @new_puz[row_number].each do |row_val|
          unless row_val.is_a? Integer
            row_val.delete num if row_val.include? num
          end
        end
      end
    end
  end
end

def clear_columns
  (0..8).each do |col|
    @new_puz.each do |puz|
      if puz[col].is_a? Integer
        num = puz[col]
        @new_puz.each do |p|
          unless p[col].is_a? Integer
            p[col].delete (num) if p[col].include? (num)
          end
        end
      end
    end
  end
end



def clear_boxes

  @box0 = @new_puz[0][0..2] + @new_puz[1][0..2] + @new_puz[2][0..2]
  @box1 = @new_puz[0][3..5] + @new_puz[1][3..5] + @new_puz[2][3..5]
  @box2 = @new_puz[0][6..8] + @new_puz[1][6..8] + @new_puz[2][6..8]
  @box3 = @new_puz[3][0..2] + @new_puz[4][0..2] + @new_puz[5][0..2]
  @box4 = @new_puz[3][3..5] + @new_puz[4][3..5] + @new_puz[5][3..5]
  @box5 = @new_puz[3][6..8] + @new_puz[4][6..8] + @new_puz[5][6..8]
  @box6 = @new_puz[6][0..2] + @new_puz[7][0..2] + @new_puz[8][0..2]
  @box7 = @new_puz[6][3..5] + @new_puz[7][3..5] + @new_puz[8][3..5]
  @box8 = @new_puz[6][6..8] + @new_puz[7][6..8] + @new_puz[8][6..8]


  @boxes = [@box0, @box1, @box2, @box3, @box4, @box5, @box6, @box7, @box8]
  
  (0..8).each do |box_number|
    @boxes.each do |box|
      box.each do |b| 
        if b.is_a? Integer
          num = b
          box.each do |p|
            unless p.is_a? Integer
              p.delete (num) if p.include? (num)
            end
          end
        end
      end
    end
  end
end
