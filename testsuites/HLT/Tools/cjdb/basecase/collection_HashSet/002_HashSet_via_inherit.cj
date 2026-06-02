/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

var set_top_uint32 : HashSet<UInt32> = HashSet<UInt32>([32,126,12,6978,13354])
var set_top_empty_uint32 : HashSet<UInt32> = HashSet<UInt32>()
var arrayInt32 : Array<Int32> = [321, -322, 10,-123,-98]

main() {
    let class_sub_ins = Class_sub_1()
    var set_main_1 :HashSet<UInt32>  =class_sub_ins.set_sub_uint32 //子类成员变量
    var set_main_2 :HashSet<UInt32> =class_sub_ins.fun_sub_c1(20)  //子类实例函数
    var set_main_3 :HashSet<Int32> = class_sub_ins.set_cint32 // 父类静态成员 set
    var set_main_4 :HashSet<UInt32> = class_sub_ins.fun_c1(set_main_1) // 父类实例成员函数 set
    var set_main_5 :HashSet<UInt8> = Class_sub_1.fun_cs1(12) // 父类静态成员函数
    let set_main_6 :HashSet<UInt8>  = Class_sub_1.fun_sub_cs1(31) //子类自有静态函数




    return 0
}
open class Clazz_1 {
    public var width : Int32 = arrayInt32[0]
    public var length : Int32 = arrayInt32[2]

    public Clazz_1(para_f1: Int32,length:Int32){
        this.width =para_f1
        this.length =length
    }
    public init(){}
   private var set_pint32 : HashSet<Int32> = HashSet<Int32>([-764,92,6124])
   public var set_cint32 : HashSet<Int32> = HashSet<Int32>([-74,9,-6954])
     public static func fun_cs1(par_1:UInt8):HashSet<UInt8>{
         var set_cuint8 : HashSet<UInt8> = HashSet<UInt8>([14,29,6])
         set_cuint8.add(par_1)
       return set_cuint8
     }

   public func fun_c1(par_1:HashSet<UInt32>,par_2!:HashSet<UInt32>=set_top_uint32 ):HashSet<UInt32>{
         var set_cuint32 : HashSet<UInt32> = par_1
         set_cuint32.add(all: set_top_uint32)
         set_cuint32.remove(12)
         set_cuint32.add(UInt32(par_2.size))
       return set_cuint32
     }
}

open class Class_sub_1 <: Clazz_1  {
  private var vP1 : Int32 =12
  public let para_sub1 : Int32 = 23
  public static var para_sub2 : Int32 = -90
  public Class_sub_1(){
          super(110,-120)
      }

  public var clazz_1_ins: Clazz_1 = Clazz_1() //父类的实例对象
  public let sub_cp1 : HashSet<Int32> =clazz_1_ins.set_cint32 //父类成员变量
  public var set_sub_uint32 : HashSet<UInt32> = HashSet<UInt32>([958,62654,121])

 public static func fun_sub_cs1(par_1:UInt8):HashSet<UInt8>{
       var set_cla_fun_s1 : HashSet<UInt8> = Clazz_1.fun_cs1(119)
       set_cla_fun_s1.add(par_1)
       set_cla_fun_s1.add((UInt8(set_cla_fun_s1.size))+100)
     return set_cla_fun_s1
 }

 public func fun_sub_c1(par_1:UInt32):HashSet<UInt32>{
       var set_cla_fun_1 : HashSet<UInt32> = clazz_1_ins.fun_c1(set_sub_uint32)
       set_cla_fun_1.add(par_1)
       set_cla_fun_1.add((UInt32(set_cla_fun_1.size))+par_1)
     return set_cla_fun_1
     }


}

