/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



var width : Int32 = 12
var length : Int32 = 10

enum TimeUnit1 {
    | Year
    | Year(Int32)
    | Month(Int32, Int32)
    | Month(Int32)
}
main() {
    let class_sub_ins = Class_sub_1()
    let class_sub_ins_3 = Class_sub_3()
    var v_main_1 : Int32 =class_sub_ins.para_sub1 //子类非静态成员变量
    let vp_1 = class_sub_ins.v2 //子类成员变量：级联调用
    let vp_2 = TimeUnit1.Month(1, 2)
    var v_main_2: Int32 = class_sub_ins.fun_1(v_main_1, para_2:1) // 子类重写父类方法:形参默认值
    var v_main_3: Int32 =Class_sub_1.fun_sub01(20) //子类自有静态函数
    var v_main_4: Int32 = Clazz_1.f_001(20) // 父类静态成员函数
    var v_main_5: Int32 = Clazz_1.para_f3 // 父类静态成员变量
    var v_main_6 = class_sub_ins.fun_f1(-12) // 父类非静态成员函数
    var v_main_7 = Class_sub_1.para_sub2 // 子类静态成员变量
    var v_main_8 = class_sub_ins.para_f2 // 父类非静态成员变量
    let v_main_9 = Class_sub_2.f1() //返回为Unit的空函数体函数
    let v_main_10 =Class_sub_2.f2(a:16) // 实现接口I1的函数
    let v_main_11 =Class_sub_2.foo1(6) //实现接口I2的函数
    let v_main_12 =Class_sub_3.foo1(21) //单接口
    var v_main_13 = class_sub_ins_3.fun_f1(-12) // Class_sub_3 <: Class_sub_1 & Class_sub_1<:Clazz_1




    return 0
}

open class Clazz_1 {
public var width : Int32 = 12
public var length : Int32 = 10
private var para_f1 : Int32 = 10
public let para_f2 : Int32 = 23
public static var para_f3 : Int32 = -90
public var para2:Int32 =0
public func f_withoutBody(): Unit {}
public func f_withoutBody(a:Int32): Unit {}
public func fun_f1(para_1: Int32): Int32 {
var vf1 : Int32 = para_1
vf1 += width
return vf1
}

public open func fun_1(para_1: Int32 , para_2!: Int32): Int32 {
    var a1: Int32  = para_1
    var b1: Int32 = para_2
    a1 = -5
    b1 = para_2 + 3
    return a1 + b1
}
    //主构造函数
    public Clazz_1(para_f1: Int32,length:Int32,para2!: Int32=10){
        this.para_f1 =para_f1
        this.length =length
    }
public init (){}
public init (width: Int32, length:Int32) {
        this.width = width
        this.length = length
    }

public static func f_001(a: Int32, b!: Int32 = 1): Int32 {
       var a1: Int32  = a
       var b1: Int32 = b
       a1 = -5
       b1 = b + 3
       return a1 + b1
   }

}

interface I1 {
   static func f1(): Unit
   static func f2(a!: Int32) :Int32{
    return 1
   }
}

interface I2 {
   static func foo1():Int32 {
        return 1
    }
}

open class Class_sub_1 <: Clazz_1  {
  private var vP1 : Int32 =12
  public let para_sub1 : Int32 = 23
  public static var para_sub2 : Int32 = -90
  public Class_sub_1(){
          super(12,20,para2:20)
      }

  public var clazz_1_ins: Clazz_1 = Clazz_1() //父类的实例对象
  public let v1 : Int32 =clazz_1_ins.width
  public var v2 : Int32 =clazz_1_ins.fun_1(12,para_2:10)
  public override func fun_1(para_1: Int32 , para_2!: Int32): Int32 { //子类重写父类方法
    var a1: Int32  = para_1
    var b1: Int32 = para_2
    a1 +=1
    b1 = para_2+ v2
    return a1 + b1
}

public static func fun_sub01(a: Int32, b!: Int32 = 1): Int32 {
       var a1: Int32  = a
       var b1: Int32 = b
       return a1 + b1
   }

}

class Class_sub_2 <: I1 & I2  { //实现2个接口
public static var v1: Int32  = 23
public static func f1(): Unit{}
public static func f2(a!: Int32 =10): Int32 {
    var a1: Int32  = a
  return a1
}
public static func foo1(a:Int32):Int32 {
        return v1 + a
    }
}

class Class_sub_3 <:Class_sub_1 & I2  {
 public static func foo1(a:Int32):Int32 {
        return  a
    }
    public Class_sub_3(){
       super()
    }

}
