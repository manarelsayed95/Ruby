class ComplexNumber

    #setter && getter
    attr_accessor :real , :img
    #state variable to count no of function calls
    @@state={ "+(other)" => 0, "*(other)" => 0 , "bulk_add​" => 0 , "bulk_multiply​" => 0};

    # constructor
    def initialize(real,img)
        @real=real
        @img=img
    end

    #override plus operator
    def +(other)
        @@state[ "+(other)"] +=1
        real =  @real+ other.real
        img  =  @img+other.img
        ComplexNumber.new(real,img)
    end

    #override multiply operator
    def *(other)
        @@state[ "*(other)"] +=1
        real = @real*other.real - @img*other.img
        img  = @real*other.img + @img*other.real
       ComplexNumber.new(real,img)
    end

    #add method -> get array of complex numbers
    def self.bulk_add​ (cns)
        @@state["bulk_add​"]+=1
        temp=cns.first
        cns.drop(1).each do |cn|
            temp =temp+cn
        end
        temp
    end

    #multiply method -> get array of complex numbers
    def self.bulk_multiply​ (cns)
        @@state["bulk_multiply​"]=@@state["bulk_multiply​"]+1
        temp=cns.first
        cns.drop(1).each do |cn|
            temp=temp*cn
        end
        temp
    end

    #get state method
    def self.get_state
        puts @@state
    end

    def to_s
        "(#{self.real}+#{self.img}i)"
    end

end

#define instances of ComplexNumber class
complex_num1=ComplexNumber.new(3,2)
complex_num2=ComplexNumber.new(1,7)
complex_num3=ComplexNumber.new(4,9)
complex_num4=ComplexNumber.new(4,5)

puts  complex_num1+complex_num2
puts  complex_num1 * complex_num2
puts  complex_num1+complex_num2+complex_num3
puts  complex_num1 * complex_num2 * complex_num3

arr=[complex_num1,complex_num2,complex_num3]
puts  ComplexNumber.bulk_add​(arr)
puts  ComplexNumber.bulk_multiply​(arr)

ComplexNumber.get_state
