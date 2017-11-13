#!/usr/bin/ruby
# -*- coding: UTF-8 -*-

require './solution.rb'

module Program
    def self.main
        puts 1
    end

    class Class1
        def function1
            puts 'class1.function1'
        end
    end

    module ProgramSon
        def self.functionsun
            puts 'class1.function1'
        end
    end
end



class MyClass
    # include Solution
    include Program
    def test(array)
        array.pop
        # self.function
        # @class2 = Class2.new
        # @class2.function2
        MyModule.function
    end

    module MyModule
        def self.function
            puts 'Module.function'
        end
    end
end


@class = MyClass::new
a = [1,2,3]
puts a
@class::test(a)
puts a

