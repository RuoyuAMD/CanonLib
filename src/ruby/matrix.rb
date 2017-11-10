#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
module Matrix

  class YoungTableaus
    
    tableaus = Array.new
    type = nil

    p_x = 1
    p_y = 0

    def set_tableaus(tableaus)
      result = is_young_tableaus(tableaus)
      if result
        Tableaus = tableaus
        type = get_young_type(tableaus)
      end
      return result
    end # set_tableaus

    def camp_array(array1,array2)
      if array1.class != Array.class or array2.class != array2.class
        return false
      elsif array1.length !=array2.length
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
        if array[index] = n
          return true
        end
        if array.first < n
          if array[index] > n
            return [n-1, n]
          end
        elsif array.first > new
          if array[index] < n
            return [n-1, n]
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
        points = []
        border.each_index |index| do
          point = get_contour_point_from_line(border[index])
          if point.class == Array.class
            if index == 0 
              points.push([[point[0],0],[point[1],0]])
            elsif index == 1
              points.push([[point[0],[border[index].length-1],[point[1],[border[index].length-1]])
            elsif index == 2
              points.push([[0,point[0]],[0,point[1]]])
            else
              points.push([[border[index].length-1,point[0]],[[border[index].length-1,point[1]]])
            end
          end
        end
        return contour_line_search_mod(n,points)
      else 
        return default_search_mod(n)
    end

    def en_have_search_mod_1()
      puts 'search_mod_1'
    end

    # params n -> the number you want search
    # direction is the come direction
    def contour_line_search_mod(n,points)
      
    end

    def default_search_mod(n)
      tableaus.each do |elements|
        if elements.include(n)
          return true
      end
      return false
    end

  end # YoungTableaus.end

end # Matrix.end