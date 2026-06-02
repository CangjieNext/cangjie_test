/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import p1.*
//import p2.*

enum TimeUnit<T1, T2> {
        | Year(T1)
        | Month(T1, T2)
        | Day(T1, T2, T2)
        | Hour(T1, T2, T2, T2)
}

enum TimeUnit2 {
        | Year(Int64)
        | Month(Int64, Int32)
        | Day(Int64, Int32, Int32)
        | Hour(Int64, Int32, Int32, Int32)
}

class C1{
    public var width: Int64
    public var length: Int64

    public init (width: Int64, length: Int64) {
        this.width = width
        this.length = length
    }
}

open class C2<T1,T2>{
    public var width: T1
    public var length: T2
    private var c2_pri: Array<Int64>
    public init (width: T1, length: T2) {
        this.width = width
        this.length = length
        this.c2_pri = [1,2,3]
    }
}

class CH <: C2<Int32,Int32> { //非泛型继承
    public let size: Int32
    public init (a: Int32) {
        super(a,a)
        size = super.width * super.length
    }
}
/*
class CH2 <: C101<Array<String>,Array<Array<Int64>>> { 
    let CH2m: Array<String>
    init (a: Array<String>,b:Array<Array<Int64>>) {
        super(a,b)
        CH2m = a
    }
}*/

class CH3 <: C2<Array<String>,Array<Int64>> { //非泛型继承
    public let data: Array<String>
    public init (a: Array<String>,b:Array<Int64>) {
        super(a,b)
        data = super.width
    }
}

struct R1<X,Y> {
   //主构造函数
    public R1(
        x: Int64, // primary constructor, it's name is the same as the struct
        y: X,
        v!: Int64 = 1, // regular parameter
        private var z!: Y // member variable parameter
    ){
        print("I am in R1 main init method.\n")
    }
}

struct R2 {
    public var width: Int64
    public var length: Int64

    public init (width: Int64, length: Int64) {
        this.width = width
        this.length = length
    }
}

func inputArray<T>(a:T){
    let in_Array = a
    return in_Array
}


func inputArray2(a!:Array<Int32>=[1,2,3]){
    let in_Array = a
    return in_Array
}

main(){

    // empty Array
    var m_empty:Array<Int64> = []
    var m_empty_2:Array<Array<Int64>> = [[1],[]]

    // Int Array
    var m_base_1 = [-9223372036854775808,-2,3,5,9223372036854775807]
    var m_base_1_1:Array<Int8> = [127,2,-128,5]
    var m_base_1_2:Array<Int16> = [32767,-1,2,3,-32768]
    var m_base_1_3:Array<Int32> = [-2147483648,2,-3,5,2147483647]
    var m_base_1_4:Array<Array<Int64>> = [[1,2,3],[4],[0]]
    var m_base_copy = m_base_1_4
    var m_base_1_5:Array<UInt8> = [0,1,9,255]
    var m_base_1_6:Array<UInt16> = [4,0,65535]
    var m_base_1_7:Array<UInt32> = [0,4294967295]
    var m_base_1_8:Array<UInt64> = [2,18446744073709551615,0]

    // Float Array
    var m_base_2 = [-1.0,2.0,3.0,0.0]
    var m_base_2_1:Array<Float16> = [1.01, 2.02, 3.20]
    var m_base_2_2:Array<Float32> = [-1.30, 2.022, 3.100, 0.030]
    var m_base_2_3:Array<Float64> = [-1.234, 2.1111, 3.1, 0.0]

    // Bool Array
    var m_base_3 = [true,false,false]

    // Rune Array
    var m_base_4 = [r'a',r'b',r'1']

    // Unit Array
    var m_base_5 = [(),()]

    // Tuple Array
    var m_base_6 = [(1,r'2'),(2,r'w')]
    var m_base_6_1 = [([1,2],(1,"String"),r'c',3),([4,5],(0,"String"),r'1',99)]

    // String
    var m_com_1 = ["12345", "what"]
    var m_com_1_1 = ["一二三四五", "上山打老虎"]
    var m_com_1_2 = [""]
    var m_com_1_3 = ["""
                        This is \n
                        a multi-line string.""","""
                        It seems a
                        a little cool."""]
    var m_com_1_4 = [##"
                        This is \n
                        a multi-line raw string"##,##"
                        It \b
                        is 酷毙了"##
                    ]
    var m_com_1_5_1 = "apples"
    var m_com_1_5_2 = 10
    var m_com_1_5 = ["There are ${m_com_1_5_2 * m_com_1_5_2} ${m_com_1_5_1}."]

    // generics enum
    var time_Year:TimeUnit<Int64,Int32> = TimeUnit.Year(2021)
    var time_Month:TimeUnit<Int64,Int32> = TimeUnit.Month(2021,9)
    var time_Day:TimeUnit<Int64,Int32> = TimeUnit.Day(2021,9,22)

    // ordinary enum
    var time_Year2 = TimeUnit2.Year(2000)
    var time_Month2 = TimeUnit2.Month(2000,1)
    var time_Day2 = TimeUnit2.Day(2000,1,1)

    var m_com_2 = [time_Year,time_Month,time_Day]
    var m_com_2_1 = [time_Year2,time_Month2,time_Day2]

    // range type
    var m_com_3 = [0..10:1,10..0:-1,1..10,1..=10]

    // class type
    var m_com_4 = [C1(1,2),C1(2,3),C1(3,4)]
    var m_com_4_1 = [C2<Int64,Int32>(1,2),C2<Int64,Int32>(11,12)]
    var m_com_4_2:Array<C2<Int32,Int32>> = [CH(2),CH(10),C2(10,20)]
    var m_com_4_3 = [CH(2),CH(10)]

    // struct type
    var m_com_5 = [R1<Bool,String>(1, true, v:2, z:"abcde")]
    var m_com_5_1 = [R2(3,2),R2(3,4)]

    // func return type 形参默认值
    var m_funcreturn_6 = inputArray<Array<C2<Int32,Int32>>>([CH(2),CH(10),C2(10,20)])
    var m_funcreturn_6_1 = inputArray2(a:m_base_1_3)

    // member variable
    var m_member_7 = [R1<Bool,Array<String>>(1, true, v:2, z:["abcde","hello"])]
    
    // 继承，查看父类成员变量
    var m_inherit_8 = [CH3(m_com_1_5,[1,2])]
    //var m_inherit_8_1 = [CH2(m_com_1_4,[[1,2,3],[45]])]
    //var m_inherit_8_2 = [C201<Array<Rune>,Array<Int64>>(m_base_4,m_base_1_4)]
    
    return 0

}
