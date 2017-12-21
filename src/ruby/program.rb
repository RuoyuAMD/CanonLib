#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
require 'pathname'

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
    def initialize()
        puts 'init'
    end
    # include Solution
    include Program
    c1 = Program::Class1::new
    c1.function1
    def self.classFunction()
        puts 'MyClass function'
    end

    def self.anotherFunction(parm)
        puts parm
        yield 1
    end

    def self.testFunction()
        anotherFunction :products do |t|
            puts t
        end
    end

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


class Alibaba
    TESTATTR = nil
    def initialize()
        super.TESTATTR = 'testAttr'
    end
    def test()
        return @testAttr
    end
    def fun()
        'fun'
    end
end




def main(argvs)
    MyClass::testFunction
    # @class = MyClass::new
    # @class2 = MyClass::new
    # a = [1,2,3]
    # puts a
    # @class::test(a)
    # puts a
    

    # a = Alibaba::new
    # b = a.send('TESTATTR')
    # puts b
    # return 0
end
main([Pathname.new(__FILE__).realpath] + ARGV)
