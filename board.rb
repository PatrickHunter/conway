class Board
  @grid = Array.new
  @size = 0
  
  def grid
    return @grid
  end
  
  def grid=(new_grid)
    @grid = new_grid
    @size = new_grid.size
  end
  
  def size
    return @size
  end
  
  def initialize(new_grid)
    @grid = new_grid
    @size=@grid.size
  end

  def step()
    new_grid = Array.new(size)
    for i in 0..(size-1)
      new_grid[i] =Array.new(size)
    end
    @grid.each_with_index do |row, outer_index|
      row.each_with_index do |cell, index|        
        new_grid[outer_index][index] = live?(outer_index,index)
      end
    end
    @grid = new_grid
  end

  def live?(outer_index, index)
    live_neighbors = col(outer_index, index)-1
    if outer_index > 0 then
      live_neighbors += col(outer_index-1 ,index)
    end
    if outer_index +1 <@size then
      live_neighbors +=col(outer_index+1, index)
    end
    
    if !@grid[outer_index][index] then
      #live neighbors is off by one if the cell live? is called on is dead
      if live_neighbors == 2 then
        return true
      else
        return false
      end
    end
    if live_neighbors < 2 or live_neighbors >3 then
      return false
    else
      return true
    end
  end

  def col(outer_index, index)
    count=0
    if index > 0 && @grid[outer_index][index-1] then
      count+=1
    end
    if @grid [outer_index][index] then
      count+=1
    end
    if index+1 <@size && @grid[outer_index][index+1] then
      count+=1
    end
    return count
  end
  
  def display()
    grid.each do |row|
      row.each do |cell|
        if cell then
          print "|*"
        else
          print "| "
        end
      end
      puts "|"
    end
  end  
end

