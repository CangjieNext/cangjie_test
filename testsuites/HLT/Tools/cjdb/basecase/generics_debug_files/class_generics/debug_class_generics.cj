/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p1.*
import p2.*

// top_level generics method
var top_c1 = C1<Int32>(10)
let top_c2 = CHC1(10)


main() {
    // use generics init and overloading init method of a one-type generics class in p101 of package p1
    let mc_1 = C1<UInt32>(100)

    // use generics init and overloading init method of a two-types generics class in p101 of package p1
    var mc2_1 = C2<Int32,Int64>(10, 20)
    
    // use generics main construction method of a two-types generics class in p101 of package p1
    var mc3_1 = C3<Bool,String>(1, true, v:2, z:"abcde")

    // use generics init method of a ten-types generics class in p101 of package p1
    var mc4_1 = C4<Int8, Int8, Int8, Int16, Int16, Int32, Int32, Int64, Int64, Unit>(1, 2, 3, 4, 5, 6, 7, 8, 9, ())

    // one-type non-generics class <: generics class
    var chr1_1 = CHC1(10)

    // two-types non-generics class <: generics class
    var chr2_1 = CHC2<Int32,Int64>(10, 20)

    // use generics static method of a two-types generics class in package p1
    var stat_1 = C2<Int32,Int32>.foo(3)

    // package p1 use:p102 C102 input: c1 in p101
    var mc102_1 = C102<C1<UInt32>>(C1<UInt32>(100,100))

    // package p2 use:p201 C201 input: c2 in p101
    var mc201_1 = C201<C2<Int32,Int64>>(C2<Int32,Int64>(10, 20))

    // use generics instance method in package p1
    var instance_1 = C2<Int32,Int32>(10,11).funcdemo1()

    // use generics operator method in package p1
    var mc_ope = mc2_1[10]

    // use generics construction method defined in this file
    var C_here = C<Int64,Int64>(22,22)
    var C_ins = C<Int64,Int64>(22,22).funcdemo1()
    var C_stat = C<Int64,Int64>.foo(18)
    var C_ope = C_here[0]

    var C_main_1 = C_main<Int64,String>(1, 3, v:2, z:"abcde")
    
    return 0
}

class C<X,Y> { 
    
    public var width: X
    public var length: Y

    
    public init (width: X, length: Y) {
        this.width = width
        this.length = length
    }

    
    public func funcdemo1(): C1<X> {
        var f_c1 = C1<X>(width,width)
        return f_c1
    }

    
    public static func foo(b: X){
        return b
    }

    
    public operator func [](index:X):Y{
        return length
    }
}

class C_main<X,Y> {
   
    public C_main(
        x: Int64, // primary constructor, it's name is the same as the struct
        y: X,
        v!: Int64 = 1, // regular parameter
        private var z!: Y // member variable parameter
    ){
        print("I am in main init method.\n")
    }
}
