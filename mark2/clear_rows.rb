
def clear_rows
  (0..8).each do |row|
    @new_puz[row].each do |p|

      if p.size == 1
        #p "found a #{p[0]} in row #{i}"
        num = p[0]

        @new_puz[row].each do |p|

          unless p.size == 1
            p.delete num if p.include? num
          end
        end
      end
    end
  end
end