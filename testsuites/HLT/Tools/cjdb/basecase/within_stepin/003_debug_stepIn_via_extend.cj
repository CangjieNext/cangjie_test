/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




var width : Int32 = 12
var length : Int32 = 10
var arrayTopInt64 : Array<Int64> =[12, 23, 34]
main() {
    let clazz_ins1 = Clazz_1(10,12)
    let clazz_ins2 = Clazz_2(12,23)
    let rectangle_ins = Rectangle_ex()
    var v_main_1 : UInt32 =Clazz_1.f_001(10)  //静态成员函数扩展
    var v_main_2: String = clazz_ins1.fun_f1("cang_jie") // 实例成员函数扩展
    var v_main_3: Int64 =Clazz_1.v1 //静态成员属性
    var v_main_4: Int64 =clazz_ins1.v2 //实例成员属性
    var v_main_5  = clazz_ins2.fun_1(clazz_ins2) //接口扩展
    var v_main_6 : String = Rectangle_ex.fun_1() //struct静态成员函数扩展
    var v_main_7  = rectangle_ins.fun_2(12) //struct实例成员函数扩展
    var v_main_8  = TimeUnit1.Year(10).f2(TimeUnit1.Year(23)) //enum实例成员函数
    var v_main_9 = TimeUnit1.Month(23) //enum静态成员函数
    var v_main_10 = clazz_ins1.fun_c1()  //class实例函数-变量为array
    var v_main_11 = rectangle_ins.fun_c1()  //struct实例函数-变量为array
    var v_main_12 = arrayTopInt64 //



    return 0
}


class Clazz_1 {
var width : Int16 = 12
var length : Int16 = 10
static var para_f3 : Int32 = -90
public var para2:Int32 =0
func f_withoutBody() {}
init (width: Int16, length:Int16) {
        this.width = width
        this.length = length
    }
func fun_c1() :Int64{
   var p_arr  = arrayTopInt64
   var va1 =arrayTopInt64[1]
   return va1+arrayTopInt64[2]
   }
}
class Clazz_2 {
var width : UInt32 = 12
var length : UInt32 = 10
static var para_f3 : Float32 = -90.01
init (width: UInt32, length:UInt32) {
        this.width = width
        this.length = length
    }
}

extend  Clazz_1{
     public static func f_001(a: UInt32, b!: UInt32 = 1): UInt32 { //扩展静态成员函数
           var a1: UInt32  = a
           var b1: UInt32 = b
           a1 = 5
           b1 = b + 3
           return a1 + b1
       }
     public func fun_f1(para_1: String): String {  //实例成员函数
           var vf1 : String = para_1
           vf1 =vf1 + "_strTest"
       return vf1
       }
     public static prop v1: Int64 { //静态成员属性
            get() { 0 }
        }
     public prop v2: Int64 { //实例成员属性
            get() { 0 }
        }

}

interface I1 {
    func foo1():Int32 {
        return 1
    }
}

extend  Clazz_2 <: I1  {
 public func foo1(a:Int32 ):Int32 {
        return  a + 10
    }

  public func fun_1(i: I1): Int32{ //接口扩展
    i.foo1()
    }

}
enum TimeUnit1 {
    | Year
    | Year(Int32)

}

extend TimeUnit1{
    public static func Month(): Unit {}
    public static func Month(pa:Int32): Int32 {
    return pa
    }
    public func f2(v: TimeUnit1): Int32 {
        return match (v) {
        			case Year => 0
        			case Year(a) => a
        			case _ => -1
                }
            }
}

struct Rectangle_ex {
    public var width: Int32 = 10
    public var var_m1: Int32 =-1
    public static let vr_1: Int32 = 79
    public static var length: Int32 = 20
    public var para2 :Int32 = -1
    private static var var_pri :Int32 =21
    //主构造函数
    public Rectangle_ex(width: Int32,var_m1:Int32,para2!: Int32=10){
        this.width =width
        this.var_m1 =var_m1
    }
        public init(){}
func fun_c1() :Int64{
   var p_arr = arrayTopInt64.clone()
   var va1 =arrayTopInt64[1]
   return va1+arrayTopInt64[2]
   }
}

  extend Rectangle_ex{
  public static  func fun_1(): String {
  var var_pri : String ="""
    多行string_test
    var p_arr :Int64 = arrayTopInt64.clone()
    var va1 =arrayTopInt64[1]
    """
    return  var_pri
 }

  public func fun_2(para_1: Int32,para2!: Int32=10): Int32 {  //实例成员函数
    var vf1 : Int32 = para_1
    vf1 += 2
    return vf1
    }
}
