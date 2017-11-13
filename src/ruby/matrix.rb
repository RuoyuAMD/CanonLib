#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
module Matrix

  class YoungTableaus
    
    Tableaus = Array.new
    Type = nil

    # point = [y,x]
    # x = point[Px]
    # y = point[Py]
    # value = array[point[Py],point[Px]]

    Px = 1
    Py = 0

    #   |- - - [3] - - -|
    #   |               |
    #   |               |
    #  [1]             [2]
    #   |               |
    #   |               |
    #   |- - - [4] - - -|

    Bord_1 = 0
    Bord_2 = 1
    Bord_3 = 2
    Bord_4 = 3

    #   [2,4,6,8,10] when n = 5 ; index_group = [1,2]
    GroupIndexFirst = 0
    GroupIndexLast = 1

    Offset = 1
    FirstElement = 0

    Horizontal = 0
    Longitudinal = 1



    def set_tableaus(tableaus)
      result = is_young_tableaus(tableaus)
      if result
        Tableaus = tableaus
        Type = get_young_type(tableaus)
      end
      return result
    end # set_tableaus

    def camp_array(array1,array2)
      if array1.class != Array.class or array2.class != array2.class
        return false
      elsif array1.length != array2.length
        return false
      else 
        array1.each_index do |index|
          if array2[index] < array1[index]
            return false
        end
      end 
      return true
    end

    def get_contour_point_from_line(array,n)
      array.each_index do |index|
        if array[index] == n
          return true
        end
        if array.first < n
          if array[index] > n
            return n-1
          end
        elsif array.first > n
          if array[index] < n
            return n - 1
          end
        else
          return true
        end 
      end
      return false
    end

    def get_borders()
      result = [[],[]]
      tableaus.each do |elements|
        result.first.push(elements.first)
        result.last.push(elements.last)
      end
      result.push(tableaus.first)
      result.push(tableaus.last)
      return result
    end

    def is_young_tableaus(tableaus)
      if tableaus.class != Array.class
        return false
      else
        tmp = nil
        tableaus.each do |row|
          if not tmp
            tmp = row
          else
            if not camp_array(tmp,row)
              return false
        end
      end
      return true
    end # is_young_tableaus


    def en_have(n,*args)

      if args[:search_mod] == 'mod1'
        return en_have_search_mod_1()

      elsif args[:search_mod] == 'contour_line_search_mod'
        border = get_borders();
        lines = []
        border.each_index |index| do
          index_group = get_contour_point_from_line(border[index])
          if index_group.is_a?(Integer)
            if index == Bord_1
              lines.push({direction: Horizontal,line_index: index_group,block_index: 0})
            elsif index == Bord_2
              lines.push({direction: Horizontal,line_index: index_group,block_index: border[index].length - Offset})
            elsif index == Bord_3
              lines.push({direction: Longitudinal,line_index: index_group,block_index: 0})
            else
              lines.push({direction: Longitudinal,line_index: index_group,block_index: border[index].length - Offset})
            end
          end
        end
        return contour_line_search_mod(n,lines,[[],[]])
      else 
        return default_search_mod(n)
    end

    def en_have_search_mod_1()
      puts 'search_mod_1'
    end

    def during (a,n,z)
      return !((n >= a and n >= z) or (n <= a and n <= z))
    end

    def get_location(line,n) #(y,x)
      if line[:direction] == Horizontal
        if Tableaus[line[:block_index] + 1][line[:line_index]]
          return [line[:line_index],line[:block_index] + 1]
        end
        if Tableaus[line[:block_index] - 1][line[:line_index]]
          return [line[:line_index],line[:block_index] - 1]
        end
        if Tableaus[line[:block_index] + 1][line[:line_index] + 1]
          return [line[:line_index] + 1,line[:block_index] + 1]
        end
        if Tableaus[line[:block_index] - 1][line[:line_index] + 1]
          return [line[:line_index] + 1,line[:block_index] - 1]
        end
      else
        if Tableaus[line[:line_index]][line[:block_index] + 1]
          return [line[:block_index] + 1,line[:line_index]]
        end
        if Tableaus[line[:line_index]][line[:block_index] - 1]
          return [line[:block_index] - 1,line[:line_index]]
        end
        if Tableaus[line[:line_index] + 1][line[:block_index] + 1]
          return [line[:block_index] + 1,line[:line_index] + 1]
        end
        if Tableaus[line[:line_index] + 1][line[:block_index] - 1]
          return [line[:block_index] - 1,line[:line_index] + 1]
        end
      end
    end

    def is_contour_line(line,n)
      if line[:direction] == Horizontal
        return during(Tableaus[line[:line_index]][line[:block_index]],n,Tableaus[line[:line_index] + 1][line[:block_index]])
      else
        return during(Tableaus[line[:block_index]][line[:line_index]],n,Tableaus[line[:block_index]][line[:line_index] + 1])
      end
    end

    def un_direction(direction)
      return direction == 1 ? 0 : 1
    end

    def get_next_line(lines_array,current_lines, n)
      line_1 = {direction: current_lines[:direction], line_index: current_lines[:line_index], block_index:current_lines[:block_index] - 1}
      line_2 = {direction: current_lines[:direction], line_index: current_lines[:line_index], block_index:current_lines[:block_index] + 1}
      line_3 = {direction: un_direction(current_lines[:direction]),line_index: current_lines[:block_index] - 1,block_index:current_lines[:line_index] + 1}
      line_4 = {direction: un_direction(current_lines[:direction]),line_index: current_lines[:block_index] - 1,block_index:current_lines[:line_index]}
      line_5 = {direction: un_direction(current_lines[:direction]),line_index: current_lines[:block_index], block_index:current_lines[:line_index] + 1}
      line_6 = {direction: un_direction(current_lines[:direction]),line_index: current_lines[:block_index], block_index:current_lines[:line_index]}
      
      if is_contour_line(line_1) and lines_array.last != line_1
        lines_array.push(current_lines) 
        return line_1
      end
      if is_contour_line(line_2) and lines_array.last != line_2
        lines_array.push(current_lines)
        return line_2
      end
      if is_contour_line(line_3) and lines_array.last != line_3
        lines_array.push(current_lines)
        return line_3
      end
      if is_contour_line(line_4) and lines_array.last != line_4
        lines_array.push(current_lines) 
        return line_4
      end
      if is_contour_line(line_5) and lines_array.last != line_5
        lines_array.push(current_lines) 
        return line_5
      end
      if is_contour_line(line_6) and lines_array.last != line_6
        lines_array.push(current_lines) 
        return line_6
      end
      return get_location(line,n)
    end

    # params n -> the number you want search
    # direction is the come direction
    def contour_line_search_mod(n,lines,arrays)
      line_1 = get_next_line(arrays.first,lines[0],n)
      line_2 = get_next_line(arrays.last,lines[1],n)
      if line_1.class == Array.class
        return line_1
      elsif line_2.class == Array.class
        return line_2
      else 
        contour_line_search_mod(n,[line_1,line_2],arrays)
      end
    end

    def default_search_mod(n)
      tableaus.each do |elements|
        if elements.include(n)
          return true
      end
      return false
    end
  end
end